import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/cubit/nav_bar_cubit.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/home/cart/tracking/tracking_screen.dart';
import 'package:foodtek_project/view/widgets/home/notification_icon_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../model/user_profile_model.dart';

class OrderDoneScreen extends StatefulWidget {
  final int estimatedDeliveryTime;
  final String userAddress;

  const OrderDoneScreen({
    super.key,
    required this.estimatedDeliveryTime,
    required this.userAddress,
  });

  @override
  State<OrderDoneScreen> createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late UserProfile driverProfile;
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();

    driverProfile = UserProfile(
      userId: '1',
      name: 'Driver Name',
      address: '123 Driver Street',
      location: LatLng(32.01517354972322, 35.86903660207451),
      profileImageUrl: 'https://www.example.com/driver.jpg',
      phoneNumber: '0780111111',
    );

    userProfile = UserProfile(
      userId: '2',
      name: 'User Name',
      address: '456 User Avenue',
      location: LatLng(31.98801277328986, 35.89498906471146),
      profileImageUrl: 'https://www.example.com/user.jpg',
      phoneNumber: '078011111',
    );

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, right: 5.w),
                child: NotificationIconWidget(),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.checkout,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 45.h),

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 1.sw,
                      maxHeight: 300.h,
                    ),
                    child: Image.asset(
                      'assets/images/congrate_photo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  Positioned(
                    bottom: 65.h,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: Container(
                            width: 57.w,
                            height: 58.h,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 23.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            Center(
              child: Text(
                AppLocalizations.of(context)!.orderSuccess,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: Text(
                "${AppLocalizations.of(context)!.orderNote} ${widget.estimatedDeliveryTime} ${AppLocalizations.of(context)!.thanks}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
            ),

            SizedBox(height: 35.h),

            Center(
              child: SizedBox(
                width: 318.w,
                child: ElevatedButton(
                  onPressed: () {
                    // Call  toggleHistoryToTrack function to change the icon
                    context.read<NavBarCubit>().toggleHistoryToTrack();

                    //  After change icon go to TrackingScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TrackingScreen(
                              driverProfile: driverProfile,
                              userProfile: userProfile,
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 18.h,
                    ),
                    backgroundColor: Color(0xFF25AE4B),
                    elevation: 10,
                    shadowColor: Color(0xFF25AE4B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.trackOrder,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
