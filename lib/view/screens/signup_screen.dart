
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/widgets/signup_widget.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Container(
            width: 1.sw,
            height: 0.35.sh,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/base_backgrund.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(18.w),
              child: SizedBox(
                width: 340.w, // Set the card width
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SignupWidget(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

