import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/functions/theme_dialog.dart';
import 'package:foodtek_project/constant/theme.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/state/theme_state.dart';
import 'package:foodtek_project/view/screens/onboarding/onboarding_screen.dart';

class ChangLangScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).scaffoldBackgroundColor,
              BlendMode.modulate,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    showThemeDialog(context);
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.chooseyourlanguage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/chang_lang_photo.png',
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.h),
                Container(
                  width: 307.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: context.read<AppCubit>().selectedLanguage,
                      icon: Icon(Icons.arrow_drop_down, size: 24.sp),
                      iconSize: 24.sp,
                      elevation: 16,
                      style: TextStyle(fontSize: 16.sp),
                      dropdownColor: Theme.of(context).cardColor,
                      onChanged: (String? newValue) {
                        context.read<AppCubit>().selectedLanguage = newValue!;
                        if (newValue == "عربي") {
                          context.read<AppCubit>().changeLang("ar");
                        } else {
                          context.read<AppCubit>().changeLang("en");
                        }
                      },
                      items:
                          <String>[
                            'English',
                            'عربي',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: 60.h),
                Container(
                  width: 307.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.continueText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
