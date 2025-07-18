import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/images.dart';
import 'package:grocery_app/shared/linear_background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offNamed("intro");
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return LinearBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset(AppImages.logo)),
        bottomNavigationBar: SizedBox(
          height: 30,
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Powered By ",
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
      
                  TextSpan(
                    text: " SNAGUL.LTD",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
