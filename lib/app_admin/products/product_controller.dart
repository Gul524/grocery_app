import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/model.dart';

class ProductsController extends GetxController {
  TextEditingController textcategoryController = TextEditingController();
  RxList<Category> products = <Category>[].obs;

  void onSaveCategoryPressed() {
    final categories = textcategoryController.text.split(",");
    for (String category in categories) {
      products.add(
        Category(id: products.length + 1, name: textcategoryController.text),
      );
    }
    Get.back();
  }
}
