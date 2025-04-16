import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';

class CongrateWidget extends StatefulWidget {
  const CongrateWidget({super.key});

  @override
  State<CongrateWidget> createState() => _CongrateWidgetState();
}

class _CongrateWidgetState extends State<CongrateWidget>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(duration: Duration(seconds: 7));
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
    _confettiController.play();

    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.w),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConfettiWidget(
                confettiController: _confettiController,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
                gravity: 0.1,
                numberOfParticles: 50,
              ),
              SizedBox(
                width: 89.w,
                height: 153.55.h,
                child: Image.asset(
                  'assets/images/phone_photo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              Text(AppLocalizations.of(context)!.
                congrats,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(AppLocalizations.of(context)!.
                passwordResetSuccess,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
