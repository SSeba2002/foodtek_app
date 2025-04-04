import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/welcome_screen2.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1.sw,
              height: 0.2.sh,
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/welcome_photo.jpg',
                    width: 328.5.w,
                    height: 219.h,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome To Foodtek',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF455A64),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),

                  Text(
                    'Enjoy A Fast And Smooth Food Delivery \n At Your Doorstep',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xFF455A64),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50.h),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(69.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  WelcomeScreen2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
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
                        onPressed: () {},
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
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? const Color(0xFF25AE4B)
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                      SizedBox(width: 40.w),

                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen2()),
                          );
                        },
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
      ),
    );
  }
}