import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/notification_model.dart';

class NotificationsWidget extends StatefulWidget {
  final Function(bool) onNotificationsUpdated;
  final VoidCallback onClose;

  const NotificationsWidget({
    required this.onNotificationsUpdated,
    required this.onClose,
    super.key,
  });

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  String _selectedTab = 'All';

  final List<NotificationModel> _notifications = [
    NotificationModel(
      title: 'Delayed Order',
      message: 'We\'re sorry! Your order is running late. New ETK: 10:30 PM. Thanks for your patience!',
      time: 'Last Wednesday at 9:42 AM',
      isRead: false,
    ),
    NotificationModel(
      title: 'Promotional Offer',
      message: 'Craving something delicious? 💹 Get 20% off on your next order. Use code: "UMMY20".',
      time: 'Last Wednesday at 9:42 AM',
      isRead: true,
    ),
    NotificationModel(
      title: 'Out for Delivery',
      message: 'Your order is on the way! 💹 Estimated arrival: 15 mins. Stay hungry!',
      time: 'Last Wednesday at 9:42 AM',
      isRead: false,
    ),
    NotificationModel(
      title: 'Order Confirmation',
      message: 'Your order has been placed 💹 We\'re preparing it now. Track your order live!',
      time: 'Last Wednesday at 9:42 AM',
      isRead: true,
    ),
    NotificationModel(
      title: 'Delivered',
      message: 'Enjoy your meal! 💹 Your order has been delivered.',
      time: 'Last Wednesday at 9:42 AM',
      isRead: true,
    ),
  ];

  List<NotificationModel> _getFilteredNotifications() {
    if (_selectedTab == 'All') {
      return _notifications;
    } else if (_selectedTab == 'Unread') {
      return _notifications.where((notification) => !notification.isRead).toList();
    } else if (_selectedTab == 'Read') {
      return _notifications.where((notification) => notification.isRead).toList();
    }
    return _notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        widget.onClose();
                      },
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.black),
                      onPressed: () {
                        // Handle more options
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTab('All', isSelected: _selectedTab == 'All'),
                    _buildTab('Unread', isSelected: _selectedTab == 'Unread'),
                    _buildTab('Read', isSelected: _selectedTab == 'Read'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: ListView.builder(
                itemCount: _getFilteredNotifications().length,
                itemBuilder: (context, index) {
                  final notification = _getFilteredNotifications()[index];
                  return _buildNotificationItem(notification);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.blue : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.blue[100]!,
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!notification.isRead)
            Container(
              width: 8.w,
              height: 8.h,
              margin: EdgeInsets.only(top: 4.h, right: 8.w),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}