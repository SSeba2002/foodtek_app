import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/chang_lang_screen.dart'; // تأكد من الاستيراد
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) setLocale;
  const SplashScreen({required this.setLocale, super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChangLangScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Image.asset(
          'assets/images/backgrund_photo.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
