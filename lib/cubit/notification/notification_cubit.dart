import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/notification/notification_state.dart';
import 'package:foodtek_project/data/notification_repository.dart';
import 'package:foodtek_project/model/notification_model.dart';
import 'package:flutter/foundation.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationCubit(this.notificationRepository) : super(NotificationInitial());

  Future<void> loadNotifications(String userId) async {
    emit(NotificationLoading());
    try {
      final List<NotificationModel> notifications =
          await notificationRepository.getNotifications(userId);

      for (var notification in notifications) {
        debugPrint(' Notification: ${notification.title} - ${notification.description}');
      }

      emit(NotificationLoaded(notifications));
    } catch (e) {
      debugPrint(' Error fetching notifications: $e');
      emit(NotificationError('Failed to load notifications'));
    }
  }
}
