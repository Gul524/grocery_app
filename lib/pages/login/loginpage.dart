import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/configs/images.dart';
import 'package:grocery_app/pages/login/loginController.dart';
import 'package:grocery_app/shared/Custom_button.dart';
import 'package:grocery_app/shared/custom_text_filed.dart';
import 'package:grocery_app/shared/linear_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Logincontroller controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(Logincontroller());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SingleChildScrollView(
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
                  "Eneter Your Mobile Number",
                  style: AppFontsStyle.largeHeadingBold(context, isBold: true),
                ),

                Text(
                  "we will Send a Verification Code",
                  style: AppFontsStyle.mediumHeadingBold(
                    context,
                    isBold: false,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone",
                      style: AppFontsStyle.mediumHeadingBold(
                        context,
                        isBold: true,
                      ),
                    ),

                    CustomTextFiled(
                      controller: controller.phoneController,
                      label: "",
                      hint: "",
                      keyboardType: TextInputType.number,
                      onChange: (value) {},
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CustomButton(
                  label: "Send OTP",
                  onTap:controller.onLoginPress,
                  fontSize: 14,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
