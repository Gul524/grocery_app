import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/configs/images.dart';
import 'package:grocery_app/shared/custom_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            AppColors.primaryColorExtraLight,
            Theme.of(context).primaryColorLight,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorLight,
              radius: 50,
              child: Image.asset(AppImages.logo, fit: BoxFit.contain),
            ),
            SizedBox(height: 20),
            Text(
              "Get Your Groceries",
              style: AppFontsStyle.largeHeadingBold(context, true),
            ),
            Text(
              "Delivered to your Door Step",
              style: AppFontsStyle.largeHeadingBold(context, true),
            ),
            SizedBox(height: 10),
            Text(
              "we delivery fresh grocery to you",
              style: AppFontsStyle.mediumHeadingBold(context, false),
            ),
            SizedBox(height: 60),
            CustomButton(
              label: "Shop Now",
              onTap: () {
                Get.toNamed("login");
              },
              fontSize: 14,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
            ),
            SizedBox(height: 60),
            Image.asset(AppImages.fruitIntroPage),
          ],
        ),
      ),
    );
  }
}
