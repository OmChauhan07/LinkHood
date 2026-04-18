import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/notification.dart';
import '../models/notification_model.dart';

class NotificationRemoteDataSource {
  final SupabaseClient _supabase;

  NotificationRemoteDataSource(this._supabase);

  /// Fetch all notifications for the currently signed-in user, newest first.
  Future<List<AppNotification>> fetchNotifications() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final response = await _supabase
        .from('notifications')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(50);

    return (response as List)
        .map((json) => NotificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Mark a single notification as read.
  Future<void> markRead(String notificationId) async {
    await _supabase
        .from('notifications')
        .update({'is_read': true})
        .eq('id', notificationId);
  }

  /// Mark all unread notifications for the current user as read.
  Future<void> markAllRead() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase
        .from('notifications')
        .update({'is_read': true})
        .eq('user_id', userId)
        .eq('is_read', false);
  }

  /// Subscribe to Realtime INSERT events on the notifications table
  /// filtered to the current user. Calls [onNew] for each new notification.
  RealtimeChannel subscribeToNotifications(
      void Function(AppNotification) onNew) {
    final userId = _supabase.auth.currentUser?.id;

    final channel = _supabase.channel('notifications:$userId');
    channel
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: userId != null
              ? PostgresChangeFilter(
                  type: PostgresChangeFilterType.eq,
                  column: 'user_id',
                  value: userId,
                )
              : null,
          callback: (payload) {
            if (payload.newRecord.isNotEmpty) {
              final notification =
                  NotificationModel.fromJson(payload.newRecord);
              onNew(notification);
            }
          },
        )
        .subscribe();

    return channel;
  }
}
