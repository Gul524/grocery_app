import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/images.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 250,
              width: Get.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColorDark,
                      AppColors.primaryColorLight,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 20.0),
                    child: Stack(
                      children: [
                        Text(
                          "Find Your Daily ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Positioned(
                          top: 25,
                          child: Text(
                            "Grocery",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: Get.width,
            child: Image.asset(AppImages.fruitDashborad),
          ),
        ),
      ],
    );
  }
}
