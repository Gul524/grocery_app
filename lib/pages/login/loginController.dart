import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void onLoginPress() {
    if (phoneController.text == "1") {
      Get.offNamed("/admin");
    } else {
      Get.offNamed("/home");
    }
  }
}
