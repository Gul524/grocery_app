import 'package:get/get.dart';
import 'package:grocery_app/models/button_model.dart';

class DashboardController extends GetxController {
  Rx<int?> selectedadminFunctionIndex = (null).obs;
  List<ButtonModel> adminFunction = [
    ButtonModel(label: "Orders", onTap: () {}),
    ButtonModel(
      label: "Products",
      onTap: () {
        Get.offNamed("/adminCategory");
      },
    ),
    ButtonModel(label: "Discounts", onTap: () {}),
    ButtonModel(label: "Deals", onTap: () {}),
    ButtonModel(label: "Riders", onTap: () {}),
    ButtonModel(label: "Settings", onTap: () {}),
  ];
}
