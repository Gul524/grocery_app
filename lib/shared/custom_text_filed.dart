import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final Function(String) onChange;

  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: AppColors.primaryColorDark,
      onChanged: onChange,
      decoration: InputDecoration(
        label: Text(label, style: AppFontsStyle.mediumHeadingBold(context)),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: AppColors.primaryColorDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: AppColors.primaryColorDark,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.primaryColorDark,
          ),
        ),
      ),
    );
  }
}
