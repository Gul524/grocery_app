import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/category/category_page.dart';
import 'package:grocery_app/app_admin/products/products/products_page.dart';
import 'package:grocery_app/models/model.dart';
import 'package:grocery_app/services/Admin_service.dart';

class AdminCategoryController extends GetxController {
  final AdminService adminService = Get.find<AdminService>();
  TextEditingController textcategoryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxList<Category> filteredcategories = <Category>[].obs;
  List<Category> categories = <Category>[];
  RxList<String> deleteCategoriesIds = <String>[].obs;
  Rx<bool> isEditSide = false.obs;
  Rx<bool> working = false.obs;
  Rx<Category?> editingCategory = Rx<Category?>(null);
  Rx<bool> isEditing = false.obs;

  @override
  void onInit() {
    super.onInit();
    onRefreshPressed();
  }

  @override
  void onClose() {
    textcategoryController.dispose();
    searchController.dispose();
    super.onClose();
  }

  void onRefreshPressed() async {
    working.value = true;

    try {
      final cat = await adminService.getCategories();
      if (cat.isNotEmpty) {
        categories = cat;
        filteredcategories.value = cat;
      } else {
        filteredcategories.clear();
        Get.snackbar("Info", "No categories found");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load categories: $e");
      filteredcategories.clear();
    } finally {
      working.value = false;
    }
  }

  void onAddPressed() {
    Get.dialog(AddCategoryDialog(controller: this));
  }

  void onSaveCategoryPressed() async {
    if (textcategoryController.text.isEmpty) {
      Get.snackbar("Warning", "Please enter at least one category");
      return;
    }
    Get.back();
    working.value = true;

    try {
      final categoryNames = textcategoryController.text.split(",");
      final categoriesToAdd =
          categoryNames
              .map((name) => Category(name: name.trim()))
              .where((cat) => cat.name.isNotEmpty)
              .toList();

      if (categoriesToAdd.isNotEmpty) {
        await adminService.addCategories(categoriesToAdd);
        Get.snackbar("Success", "Categories added successfully");
        textcategoryController.clear();
        onRefreshPressed();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add categories: $e");
    } finally {
      working.value = false;
    }
  }

  void onUpdateCategoryPressed() async {
    if (editingCategory.value == null || textcategoryController.text.isEmpty) {
      Get.snackbar("Warning", "Please enter category name");
      return;
    }
    working.value = true;
    Get.back();
    try {
      final updatedCategory = Category(
        id: editingCategory.value!.id,
        name: textcategoryController.text.trim(),
      );

      await adminService.updateCategory(updatedCategory);
      Get.snackbar("Success", "Category updated successfully");
      // Reset editing state
      isEditing.value = false;
      editingCategory.value = null;
      textcategoryController.clear();
      onRefreshPressed();
    } catch (e) {
      Get.snackbar("Error", "Failed to update category: $e");
    } finally {
      working.value = false;
    }
  }

  void onEditCategoryPressed(Category category) {
    editingCategory.value = category;
    textcategoryController.text = category.name;
    isEditing.value = true;
    onAddPressed();
  }

  bool checkDeleteList(String id) {
    return deleteCategoriesIds.contains(id);
  }

  void toggleCategorySelection(String id) {
    if (deleteCategoriesIds.contains(id)) {
      deleteCategoriesIds.remove(id);
    } else {
      deleteCategoriesIds.add(id);
    }
  }

  void onDeletePressed() async {
    if (deleteCategoriesIds.isEmpty) {
      Get.snackbar("Warning", "Please select at least one category to delete");
      return;
    }

    working.value = true;
    try {
      await adminService.deleteCategories(deleteCategoriesIds);
      Get.snackbar("Success", "Categories deleted successfully");
      deleteCategoriesIds.clear();
      isEditSide.value = false;
      onRefreshPressed();
    } catch (e) {
      Get.snackbar("Error", "Failed to delete categories: $e");
    } finally {
      working.value = false;
    }
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      filteredcategories.value = categories;
    } else {
      final filtered =
          categories
              .where(
                (cat) => cat.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      filteredcategories.value = filtered;
    }
  }

  // Navigate to products page for selected category
  void onCategoryPressed(Category category) {
    Get.toNamed(AdminProductPage.name, arguments: {"category": category});
  }

  // Clear all selections
  void clearSelections() {
    deleteCategoriesIds.clear();
    isEditSide.value = false;
  }
}
