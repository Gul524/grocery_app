import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/configs/images.dart';
import 'package:grocery_app/pages/login/loginController.dart';
import 'package:grocery_app/shared/custom_button.dart';
import 'package:grocery_app/shared/custom_text_filed.dart';
import 'package:grocery_app/shared/linear_background.dart';

class OTPPage extends StatelessWidget {
  final controller = Get.find<Logincontroller>();
  OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    radius: 50,
                    child: Image.asset(AppImages.logo, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "OTP Verification",
                    style: AppFontsStyle.largeHeadingBold(
                      context,
                      isBold: true,
                    ),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: 300,
                    child: CustomTextFiled(
                      controller: controller.otpController,
                      label: "",
                      hint: "",
                      keyboardType: TextInputType.number,
                      onChange: (value) {},
                    ),
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 50),
                  CustomButton(
                    label: "Verify OTP",
                    onTap: () {
                      Get.toNamed("/home");
                    },
                    fontSize: 14,
                    isCenterLabel: false,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Resend OTP",
                        style: AppFontsStyle.mediumHeadingBold(
                          context,
                          isDisable: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
