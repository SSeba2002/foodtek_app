import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';

class CustomFoodtekLogoWidget extends StatelessWidget {
  const CustomFoodtekLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      width: responsiveWidth(context, 307),
      height: responsiveHeight(context, 85),
      child: Image.asset("assets/images/foodtek-logo.png", fit: BoxFit.contain),
    );
  }
}
