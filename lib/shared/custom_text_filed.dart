import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final Function(String) onChange;
  final bool showBorder;
  final int maxLines;

  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.onChange = _defaultOnChange,
    this.showBorder = false,
    this.maxLines = 1,
  });

  static void _defaultOnChange(String v) {}
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      cursorColor: AppColors.primaryColorDark,
      onChanged: onChange,
      style: AppFontsStyle.mediumHeadingBold(context, isBold: false),
      decoration: InputDecoration(
        label: Text(label, style: AppFontsStyle.mediumHeadingBold(context)),
        hintText: hint,
        hintStyle: AppFontsStyle.mediumHeadingBold(context, isBold: false),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: (showBorder) ? 2 : 0,
            color: AppColors.primaryColorDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: (showBorder) ? 2 : 0,
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
