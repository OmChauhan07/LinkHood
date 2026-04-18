import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/notifications/presentation/providers/notification_provider.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref);
});

/// Thin initializer that warms up the notifications provider when the app starts,
/// so the Realtime subscription is active from the moment the user logs in.
class NotificationService {
  final Ref _ref;

  NotificationService(this._ref);

  void init() {
    // Reading the provider kicks off the AsyncNotifier build(),
    // which fetches notifications and starts the Realtime subscription.
    _ref.read(notificationsProvider);
  }
}
