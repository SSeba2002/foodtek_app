import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/theme.dart';

class RoundTextfield extends StatelessWidget {
  // the search text field
  void Function()? onPressed;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? bgColor;
  final Widget? left;
  final Widget? right;

  RoundTextfield({
    super.key,
    required this.hintText,
    required this.onPressed,
    this.controller,
    this.keyboardType,
    this.bgColor,
    this.left,
    this.obscureText = false,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.filter_list),
        ),
        hintStyle: TextStyle(
          color: AppColors.onBoardingtextColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
