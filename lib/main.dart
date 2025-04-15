import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/home/profile/profile_screen.dart';
import 'package:foodtek_project/view/screens/onboarding/onboarding_screen.dart';
import 'package:foodtek_project/view/screens/splash_screen.dart';

import 'view/screens/chang_lang_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FoodTek',
          home: SplashScreen(),
        );
      },
    );
  }
}