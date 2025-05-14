import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/functions/theme_dialog.dart';
import 'package:foodtek_project/view/widgets/auth/custom_foodtek_logo.dart';
import 'package:foodtek_project/view/widgets/auth/reuesble_scaffold_widget.dart';
import 'package:foodtek_project/view/widgets/auth/signup_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: IconButton(
                      onPressed: () {
                        showThemeDialog(context);
                      },
                      icon: Icon(Icons.brightness_4_outlined, size: 30),
                    ),
                  ),
                ],
              ),
              CustomFoodtekLogoWidget(),
              Center(
                child: Align(
                  child: Padding(
                    padding: EdgeInsets.all(18.w),
                    child: SizedBox(
                      width: 340.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        color: Theme.of(context).cardColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: SignupWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
