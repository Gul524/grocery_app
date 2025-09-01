import 'package:get/get.dart';
import 'package:grocery_app/models/button_model.dart';
import 'package:grocery_app/services/Admin_service.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.put(() => AdminService());
  }

  Rx<int?> selectedadminFunctionIndex = (null).obs;
  List<ButtonModel> adminFunction = [
    ButtonModel(label: "Orders", onTap: () {}),
    ButtonModel(
      label: "Products",
      onTap: () {
        Get.toNamed("/adminCategory");
      },
    ),
    ButtonModel(label: "Discounts", onTap: () {}),
    ButtonModel(label: "Deals", onTap: () {}),
    ButtonModel(label: "Riders", onTap: () {}),
    ButtonModel(label: "Settings", onTap: () {}),
  ];
}
