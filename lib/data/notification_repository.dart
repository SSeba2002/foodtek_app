import 'package:foodtek_project/services/notification_service.dart';
import '../model/notification_model.dart';

class NotificationRepository {
  final NotificationApiService apiService;

  NotificationRepository(this.apiService);

  Future<List<NotificationModel>> getNotifications(String userId) async {
    try {
      final notifications = await apiService.fetchNotifications(userId);
      return notifications;
    } catch (e) {
      print('Exception in getNotifications: $e');
      throw Exception('Failed to load notifications');
    }
  }
}
