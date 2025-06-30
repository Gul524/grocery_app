import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/configs/images.dart';
import 'package:grocery_app/pages/login/loginController.dart';
import 'package:grocery_app/shared/Custom_button.dart';

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
              "Eneter Your Mobile Number",
              style: AppFontsStyle.largeHeadingBold(context, true),
            ),

            SizedBox(height: 10),
            Text(
              "we will Send a Verification Code",
              style: AppFontsStyle.mediumHeadingBold(context, false),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(13, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: NumberWidget(
                      number: controller.phoneNumber,
                      index: i,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 60),
            CustomButton(
              label: "Send OTP",
              onTap: () {
                Get.toNamed("login");
              },
              fontSize: 14,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        KeyRow(
                          keyNumber1: "1",
                          keyNumber2: "2",
                          keyNumber3: "3",
                        ),
                        KeyRow(
                          keyNumber1: "4",
                          keyNumber2: "5",
                          keyNumber3: "6",
                        ),
                        KeyRow(
                          keyNumber1: "7",
                          keyNumber2: "8",
                          keyNumber3: "9",
                        ),
                        KeyRow(
                          keyNumber1: "",
                          keyNumber2: "0",
                          keyNumber3: "⌫",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  final RxList<String> number;
  final int index;
  const NumberWidget({super.key, required this.number, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Text(
             number.value[index],
            style: AppFontsStyle.largeHeadingBold(context, false),
          ),
        ),
        SizedBox(
          width: 30,
          child: Divider(
            color: Theme.of(context).primaryColorDark,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}

class KeyRow extends StatelessWidget {
  final String keyNumber2;
  final String keyNumber3;
  final String keyNumber1;
  const KeyRow({
    super.key,
    required this.keyNumber1,
    required this.keyNumber2,
    required this.keyNumber3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        KeyPadWidget(keyNumber: keyNumber1),
        KeyPadWidget(keyNumber: keyNumber2),
        KeyPadWidget(keyNumber: keyNumber3),
      ],
    );
  }
}

class KeyPadWidget extends StatelessWidget {
  final String keyNumber;
  const KeyPadWidget({super.key, required this.keyNumber});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Logincontroller>();
    return InkWell(
      onTap: () {
        if (keyNumber == "⌫") {
          controller.phoneNumber[controller.currentIndexPhone] = "";
          controller.currentIndexPhone--;
        } else {
          if (keyNumber.isNotEmpty) {
            controller.phoneNumber[controller.currentIndexPhone] = keyNumber;
            controller.currentIndexPhone++;
          }
        }
      },
      child: Text(
        keyNumber.toString(),
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: 30,
        ),
      ),
    );
  }
}
