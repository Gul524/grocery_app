import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isIconButton;
  final bool isPrimaryButton;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  const CustomButton({
    super.key,
    required this.label,
    this.icon = Icons.radio_button_on,
    required this.onTap,
    this.isIconButton = false,
    this.isPrimaryButton = true,
    this.fontSize = 14,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                (isPrimaryButton)
                    ? [AppColors.primaryColorDark, AppColors.primaryColorLight]
                    : [],
          ),
          border: Border.all(color: AppColors.primaryColorDark),
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: Padding(
          padding: padding,
          child:
              //  Center(
              //   child:
              (isIconButton)
                  ? Icon(
                    icon,
                    color:
                        (isPrimaryButton)
                            ? Theme.of(context).primaryColorLight
                            : AppColors.primaryColorDark,
                  )
                  : Text(
                    label,
                    style: TextStyle(
                      fontSize: fontSize,
                      color:
                          (isPrimaryButton)
                              ? Theme.of(context).primaryColorLight
                              : AppColors.primaryColorDark,
                    ),
                  ),
        ),
      ),
      // ),
    );
  }
}
