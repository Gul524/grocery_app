import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChange;
  final Function() onSettingPress;
  const SearchField({
    super.key,
    required this.controller,
    required this.onChange,
    required this.onSettingPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColorLight,
      onChanged: onChange,
      style: AppFontsStyle.mediumHeadingBold(context, isBold: false),
      decoration: InputDecoration(
        hintStyle: AppFontsStyle.mediumHeadingBold(context, isBold: false),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColorDark,
        ),
        suffixIcon: IconButton(
          onPressed: onSettingPress,
          icon: Icon(
            Icons.tune_rounded,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        filled: true,
        isDense: true,
        hintText: "Search ...",
        fillColor: Theme.of(context).primaryColorLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.primaryColorDark),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.primaryColorDark),
        ),
      ),
    );
  }
}
