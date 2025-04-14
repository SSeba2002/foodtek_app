import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/onboarding/onboarding_screen.dart';
import '../../constant/colors.dart';

class ChangLangScreen extends StatefulWidget {
  @override
  _ChangLangScreenState createState() => _ChangLangScreenState();
}

class _ChangLangScreenState extends State<ChangLangScreen> {
  String? _selectedLanguage = 'English';

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
              Colors.white,
              BlendMode.modulate,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 20.h, // Reduced top padding to move title higher
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h), // Reduced space above title
                Text(
                  'Choose your language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h), // Increased space below title
                Image.asset(
                  'assets/images/chang_lang_photo.png',
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.h), // Increased space above dropdown

                // Responsive dropdown container
                Container(
                  width: 307.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedLanguage,
                      icon: Icon(Icons.arrow_drop_down, size: 24.sp),
                      iconSize: 24.sp,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      dropdownColor: Colors.white,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLanguage = newValue!;
                        });
                      },
                      items: <String>['English', 'Arabic']
                          .map<DropdownMenuItem<String>>((String value) {
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

                SizedBox(height: 60.h), // Increased space between dropdown and button
                Container(
                  width: 307.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.secondaryColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Language selected: $_selectedLanguage');
                      Navigator.push(
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
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h), // Added some space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}