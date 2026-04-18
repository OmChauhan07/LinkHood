import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/datasources/notification_remote_datasource.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

final _notificationDataSourceProvider = Provider<NotificationRemoteDataSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return NotificationRemoteDataSource(client);
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(ref.watch(_notificationDataSourceProvider));
});

class NotificationController {
  final NotificationRepository _repo;

  NotificationController(this._repo);

  Future<void> markRead(String notificationId) async {
    await _repo.markRead(notificationId);
  }

  Future<void> markAllRead() async {
    await _repo.markAllRead();
  }
}

final notificationControllerProvider = Provider<NotificationController>((ref) {
  return NotificationController(ref.watch(notificationRepositoryProvider));
});

final notificationsProvider = StreamProvider.autoDispose<List<AppNotification>>((ref) async* {
  final repo = ref.watch(notificationRepositoryProvider);
  final dataSource = ref.watch(_notificationDataSourceProvider);
  
  // 1. Fetch and yield initial data
  List<AppNotification> currentNotifs = await repo.getNotifications();
  yield currentNotifs;
  
  // 2. Setup stream for Realtime updates
  final controller = StreamController<List<AppNotification>>();
  
  final channel = dataSource.subscribeToNotifications((newNotif) {
    currentNotifs = [newNotif, ...currentNotifs];
    controller.add(currentNotifs);
  });
  
  ref.onDispose(() {
    channel.unsubscribe();
    controller.close();
  });
  
  yield* controller.stream;
});

final unreadCountProvider = Provider.autoDispose<int>((ref) {
  final notifs = ref.watch(notificationsProvider).asData?.value ?? [];
  return notifs.where((n) => !n.isRead).length;
});
