import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 11),
            Image.asset(
              'assets/images/Empty-cart.png',
              width: 282.w,
              height: 282.h,
            ),
            SizedBox(height: 18.h),
            Text(
              AppLocalizations.of(context)!.cartEmpty,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                AppLocalizations.of(context)!.cartEmptyMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6C7278),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}