import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({super.key});

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            height: 0.3.sh,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/welcome_phot2.jpg',
                  width: 328.5.w,
                  height: 219.h,
                ),
                SizedBox(height: 20.h),

                Text(
                  'Get Delivery On Time',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF455A64),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),

                Text(
                  'Order your favorite food within the \n palm of your hand and the zone\n of your comfort.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: const Color(0xFF455A64),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h),

                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(69.r),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 55.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xFF455A64),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),

                    Row(
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: index == 1 ? const Color(0xFF25AE4B) : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: 40.w),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: const Color(0xFF25AE4B),
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
