import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/notification/notification_state.dart';

import 'package:foodtek_project/view/widgets/home/notifications_widget.dart';
import 'package:foodtek_project/cubit/notification/notification_cubit.dart';

import 'package:flutter/material.dart';

void openNotificationSheet(BuildContext context, String userId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.75, 
      child: NotificationsWidget(
        userId: userId,
        onNotificationsUpdated: (_) {},
        onClose: () => Navigator.pop(context), 
      ),
    ),
  );
}

class NotificationIconWidget extends StatelessWidget {
  final String userId;
  const NotificationIconWidget({Key? key, required this.userId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final hasUnread =
            state is NotificationLoaded
                ? state.notifications.any((n) => !n.isRead)
                : false;

        return Stack(
          children: [
            GestureDetector(
              onTap: () => openNotificationSheet(context, userId),
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 20.w,
                ),
              ),
            ),
            if (hasUnread)
              Positioned(
                right: 4.w,
                top: 4.h,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
