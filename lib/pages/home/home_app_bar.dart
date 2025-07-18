import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/pages/home/cart_button.dart';
import 'package:grocery_app/shared/search_field.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width - 130,
                child: SearchField(
                  controller: TextEditingController(),
                  onChange: (p0) {},
                  onSettingPress: () {},
                ),
              ),
              SizedBox(
                width: 70,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                      child: CartButton(onTap: () {}),
                    ),
                    Positioned(
                      right: 0,
                      top: 4,
                      child: Badge(
                        padding: EdgeInsets.all(4),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textColor: Colors.white,
                        backgroundColor: AppColors.primaryColorDark,
                        label: Text("2"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
