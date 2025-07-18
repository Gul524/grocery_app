import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/category.dart';

class ProductsController extends GetxController {
  TextEditingController textcategoryController = TextEditingController();
  RxList<Category> products = <Category>[].obs;

  void onSaveCategoryPressed() {
    // final categories = textcategoryController.text.split("");
    products.value.add(
      Category(id: products.length + 1, name: textcategoryController.text),
    );
    Get.back();
  }
}
