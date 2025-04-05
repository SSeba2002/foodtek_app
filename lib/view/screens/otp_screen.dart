import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _codecontrollers =
  List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/base_backgrund.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black26,
                  ),
                ),
              ),
              Center(
                child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 40.w ),
                 child: Container(
                  width: 343.w,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/otp_photo.jpg',
                        width: 151.w,
                        height: 151.h,
                      ),
                      Text(
                        'A 4-digit code has been sent t your email.\n    please enter it to verify.     ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xFF6C7278),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 50.w,
                            height: 46.h,
                            child: TextField(
                              controller: _codecontrollers[index],
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 15.h),
                      ElevatedButton(
                        onPressed: () {
                          String otp = _codecontrollers
                              .map((controller) => controller.text)
                              .join();
                          print('Entered OTP: $otp');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(295.w, 45.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
            ],
          );
        },
      ),
    );
  }
}
