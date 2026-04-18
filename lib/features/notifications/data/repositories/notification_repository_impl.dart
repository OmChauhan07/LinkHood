import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_datasource.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _dataSource;

  NotificationRepositoryImpl(this._dataSource);

  @override
  Future<List<AppNotification>> getNotifications() =>
      _dataSource.fetchNotifications();

  @override
  Future<void> markRead(String notificationId) =>
      _dataSource.markRead(notificationId);

  @override
  Future<void> markAllRead() => _dataSource.markAllRead();
}
