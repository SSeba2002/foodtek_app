import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:foodtek_project/view/screens/auth/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen.ForgetPasswordScreen({super.key});
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/base_backgrund.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 343.w,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Column(
              mainAxisSize: MainAxisSize.min, // هذا السطر هو الحل
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 22.w,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back to Login Page?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 32.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Enter your E-mail or phone and we'll\n"
                      "send you a link to get back into\n"
                      "your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500),
                  ),
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: 295.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(37, 174, 75, 1),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}