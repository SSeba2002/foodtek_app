
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/user_profile_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import '../../screens/home/cart/tracking/chat_screen.dart';

class DriverInfoCard extends StatelessWidget {
  final UserProfile driverProfile;
  final BuildContext context;

  const DriverInfoCard({
    super.key,
    required this.driverProfile,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(driverProfile.profileImageUrl),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.yourDeliveryHero,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  children: [
                    Text(
                      driverProfile.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFF2AB58), size: 13.w),
                        SizedBox(width: 2.w),
                        Text(
                          "4.8",
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildActionButton(Icons.call, Color(0xFF4CAF50)),
          SizedBox(width: 8.w),
          _buildActionButton(Icons.chat, Color(0xFFF2AB58)),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF5F5F5),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 20.w),
        onPressed: () {
          if (icon == Icons.call) {
            _makePhoneCall(driverProfile.phoneNumber);
          } else if (icon == Icons.chat) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          }
        },
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {

    }
  }
}