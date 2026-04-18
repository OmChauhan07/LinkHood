import '../entities/notification.dart';

abstract class NotificationRepository {
  /// Fetch all notifications for the current user, newest first.
  Future<List<AppNotification>> getNotifications();

  /// Mark a single notification as read.
  Future<void> markRead(String notificationId);

  /// Mark all notifications as read for the current user.
  Future<void> markAllRead();
}
