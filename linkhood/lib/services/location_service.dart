import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class LocationService {
  /// Check and request location permissions, then get current position
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled. Please enable them in settings.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied. Please enable them in app settings.',
      );
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }

  /// Reverse geocode lat/lng to a short place name (like Google Maps)
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        // Use subLocality (area/neighborhood) + locality (city) for a map-like name
        final area = p.subLocality ?? p.name;
        final city = p.locality;
        if (area != null && area.isNotEmpty && city != null && city.isNotEmpty && area != city) {
          return '$area, $city';
        } else if (city != null && city.isNotEmpty) {
          return city;
        } else if (area != null && area.isNotEmpty) {
          return area;
        } else if (p.administrativeArea != null && p.administrativeArea!.isNotEmpty) {
          return p.administrativeArea!;
        }
      }
      return 'Unknown location';
    } catch (e) {
      return 'Could not determine location';
    }
  }

  /// Save user's location to the backend
  Future<Map<String, dynamic>> saveLocationToBackend(double lat, double lng, {String? address}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      return {'success': false, 'message': 'Not authenticated'};
    }

    final url = Uri.parse('${Config.baseUrl}/api/users/location');
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'lat': lat, 'lng': lng}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Save location locally for future use
        await prefs.setDouble('user_lat', lat);
        await prefs.setDouble('user_lng', lng);
        if (address != null) {
          await prefs.setString('user_address', address);
        }
        return {'success': true, 'data': data};
      } else {
        return {'success': false, 'message': data['error'] ?? 'Failed to save location'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error: $e'};
    }
  }

  /// Fetch nearby requests from the backend
  Future<Map<String, dynamic>> fetchNearbyRequests(double lat, double lng, {int radius = 1000}) async {
    final url = Uri.parse(
      '${Config.baseUrl}/api/items/nearby-requests?lat=$lat&lng=$lng&radius=$radius',
    );

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': data};
      } else {
        return {'success': false, 'message': data['error'] ?? 'Failed to fetch requests'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error: $e'};
    }
  }

  /// Check if user has a saved location locally
  Future<Map<String, double>?> getSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble('user_lat');
    final lng = prefs.getDouble('user_lng');
    if (lat != null && lng != null) {
      return {'lat': lat, 'lng': lng};
    }
    return null;
  }

  /// Get saved address string
  Future<String?> getSavedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_address');
  }
}
