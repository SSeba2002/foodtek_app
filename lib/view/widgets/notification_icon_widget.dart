import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/widgets/notifications_widget.dart';

class NotificationIconWidget extends StatefulWidget {
  const NotificationIconWidget({super.key});

  @override
  State<NotificationIconWidget> createState() => _NotificationIconWidgetState();
}

class _NotificationIconWidgetState extends State<NotificationIconWidget> {
  bool hasNewNotifications = false;
  OverlayEntry? _overlayEntry;

  void _openNotifications(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: _closeNotifications,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: NotificationsWidget(
                onNotificationsUpdated: (hasUnread) {
                  setState(() {
                    hasNewNotifications = hasUnread;
                  });
                },
                onClose: _closeNotifications,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeNotifications() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _openNotifications(context),
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
        if (hasNewNotifications)
          Positioned(
            right: 8.w,
            top: 8.h,
            child: Container(
              width: 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}