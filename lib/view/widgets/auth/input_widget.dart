import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String label;
  bool obscureText;
  String? errorText;
  String? hintText;
  Widget prefixIcon;
  int? maxLines;
  TextInputType? keyboardType;
  Widget? suffixIcon;

  InputWidget({
    super.key,
    required this.textEditingController,
    required this.obscureText,
    required this.prefixIcon,
    required this.label,
    this.suffixIcon,
    this.maxLines,
    this.keyboardType,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: textEditingController,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        errorText: errorText,
      ),
    );
  }
}