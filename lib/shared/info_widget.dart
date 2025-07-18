import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.infoBGColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.infoForeColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Note : use comma < , > for adding multiple category at once.\nExample : Dessart,Drinks,etc",
          style: AppFontsStyle.mediumHeadingBold(
            context,
            isBold: false,
            color: AppColors.infoForeColor,
          ),
        ),
      ),
    );
  }
}
