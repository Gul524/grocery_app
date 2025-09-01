import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/products/product_add_page.dart';
import 'package:grocery_app/models/model.dart';
import 'package:grocery_app/services/Admin_service.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductController extends GetxController {
  Category? selectedCategory;
  final AdminService adminService = Get.find<AdminService>();

  // Controllers
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController variationNameController = TextEditingController();
  TextEditingController variationCostController = TextEditingController();

  // State variables
  List<Product> products = <Product>[];
  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<String> deleteProductIds = <String>[].obs;
  Rx<bool> isEditSide = false.obs;
  Rx<bool> working = false.obs;

  // Product editing
  Rx<Product?> editingProduct = Rx<Product?>(null);
  Rx<bool> isEditing = false.obs;

  // Product variations
  RxList<ProductVariation> variations = <ProductVariation>[].obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  @override
  void onInit() {
    super.onInit();
    if (selectedCategory != null) {
      onRefreshPressed();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    nameController.dispose();
    priceController.dispose();
    variationNameController.dispose();
    variationCostController.dispose();
    super.onClose();
  }

  // Set selected category and load products
  void setSelectedCategory(Category category) {
    selectedCategory = category;
    onRefreshPressed();
  }

  // Add new product
  Future<void> saveProduct() async {
    working.value = true;
    try {
      final product = Product(
        name: nameController.text.trim(),
        price: int.tryParse(priceController.text) ?? 0,
        categoryId: int.tryParse(selectedCategory!.id) ?? 0,
        variations: variations.toList(),
        imageBytes: imageBytes.value,
      );

      await adminService.addProducts(selectedCategory!.id, [product]);
      clearForm();
      final control = Get.snackbar("Success", "Product added successfully");
      control.future.then((_) {
        Get.back();
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to add product: $e");
    } finally {
      working.value = false;
    }
  }

  // Update existing product
  Future<void> updateProduct() async {
    working.value = true;
    try {
      final updatedProduct = Product(
        id: editingProduct.value!.id,
        imageBytes: imageBytes.value,
        name: nameController.text.trim(),
        description: descriptionController.text,
        price: int.tryParse(priceController.text) ?? 0,
        categoryId: int.tryParse(selectedCategory!.id) ?? 0,
        quantity: editingProduct.value?.quantity ?? 0,
        variations: variations.toList(),
        isDiscounted: editingProduct.value!.isDiscounted,
        discountPercent: editingProduct.value!.discountPercent,
        discountAmount: editingProduct.value!.discountAmount,
      );
      await adminService.updateProduct(selectedCategory!.id, updatedProduct);
      final control = Get.snackbar("Success", "Product updated successfully");
      control.future.then((_) {
        Get.back();
      });
      isEditing.value = false;
      editingProduct.value = null;
      clearForm();
    } catch (e) {
      Get.snackbar("Error", "Failed to update product: $e");
    } finally {
      working.value = false;
    }
  }

  // Start editing a product
  void onEditProductPressed(Product product) {
    editingProduct.value = product;
    nameController.text = product.name;
    descriptionController.text = product.description;
    priceController.text = product.price.toString();
    imageBytes.value = product.imageBytes;
    variations.clear();
    variations.addAll(product.variations);
    isEditing.value = true;
    Get.toNamed(ProductAdditionForm.name, arguments: {"controller": this});
  }

  // Cancel editing
  void onCancelEditPressed() {
    isEditing.value = false;
    editingProduct.value = null;
    clearForm();
  }

  // Clear form
  void clearForm() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    variationNameController.clear();
    variationCostController.clear();
    variations.clear();
    imageBytes.value = null;
  }

  // Add variation
  void onAddVariationPressed() {
    if (variationNameController.text.isEmpty) {
      Get.snackbar("Error", "Variation name cannot be empty");
      return;
    }

    final extraAmount = double.tryParse(variationCostController.text) ?? 0.0;

    variations.add(
      ProductVariation(
        name: variationNameController.text.trim(),
        extraAmount: extraAmount,
      ),
    );

    // Clear variation inputs
    variationNameController.clear();
    variationCostController.clear();

    Get.snackbar("Success", "Variation added");
  }

  // Remove variation
  void onRemoveVariationPressed(int index) {
    if (index >= 0 && index < variations.length) {
      variations.removeAt(index);
      Get.snackbar("Success", "Variation removed");
    }
  }

  // Image handling
  void onImagePressed() {
    if (imageBytes.value == null) {
      Get.snackbar("Info", "No image selected");
      return;
    }

    Get.dialog(
      Dialog(
        child: InteractiveViewer(
          child: Image.memory(imageBytes.value!, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Future<void> imageUpload() async {
    try {
      final image = await ImagePicker.platform.getImageFromSource(
        source: ImageSource.gallery,
      );

      if (image == null) {
        Get.snackbar("Info", "No image selected");
        return;
      }

      imageBytes.value = await image.readAsBytes();
      Get.snackbar("Success", "Image selected");
    } catch (e) {
      Get.snackbar("Error", "Failed to select image: $e");
    }
  }

  // Refresh products list
  void onRefreshPressed() async {
    if (selectedCategory == null) return;

    working.value = true;

    try {
      final productsList = await adminService.getProducts(selectedCategory!.id);
      products = productsList;
      filteredProducts.value = productsList;
    } catch (e) {
      Get.snackbar("Error", "Failed to load products: $e");
      products.clear();
      filteredProducts.clear();
    } finally {
      working.value = false;
    }
  }

  // Search products
  void onSearchChanged(String query) {
    if (query.isEmpty) {
      filteredProducts.value = products;
    } else {
      final filtered =
          products
              .where(
                (product) =>
                    product.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      filteredProducts.value = filtered;
    }
  }

  // Check if product is in delete list
  bool checkDeleteList(String id) {
    return deleteProductIds.contains(id);
  }

  // Toggle product selection for deletion
  void toggleProductSelection(String id) {
    if (deleteProductIds.contains(id)) {
      deleteProductIds.remove(id);
    } else {
      deleteProductIds.add(id);
    }
  }

  // Delete selected products
  void onDeletePressed() async {
    if (deleteProductIds.isEmpty) {
      Get.snackbar("Warning", "Please select at least one product to delete");
      return;
    }

    working.value = true;

    try {
      await adminService.deleteProducts(selectedCategory!.id, deleteProductIds);
      Get.snackbar("Success", "Products deleted successfully");
      deleteProductIds.clear();
      isEditSide.value = false;
      onRefreshPressed();
    } catch (e) {
      Get.snackbar("Error", "Failed to delete products: $e");
    } finally {
      working.value = false;
    }
  }

  // Clear all selections
  void clearSelections() {
    deleteProductIds.clear();
    isEditSide.value = false;
  }

  Future<void> onCheckPressed() async {
    if (selectedCategory == null) {
      Get.snackbar("Error", "No category selected");
      return;
    }

    if (nameController.text.isEmpty) {
      Get.snackbar("Error", "Product name cannot be empty");
      return;
    }

    if (priceController.text.isEmpty) {
      Get.snackbar("Error", "Price cannot be empty");
      return;
    }
    if (isEditing.value) {
      await updateProduct();
    } else {
      await saveProduct();
    }
    await Future.delayed(Duration(milliseconds: 2000));
    onRefreshPressed();
  }
}
