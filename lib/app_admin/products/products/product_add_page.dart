import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/products/product_controller.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/shared/custom_text_filed.dart';

class ProductAdditionForm extends StatefulWidget {
  static const String name = "/productAddForm";
  const ProductAdditionForm({super.key});

  @override
  State<ProductAdditionForm> createState() => _ProductAdditionFormState();
}

class _ProductAdditionFormState extends State<ProductAdditionForm> {
  late AdminProductController controller;

  @override
  initState() {
    super.initState();
    controller = Get.arguments["controller"];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.clearForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColorDark,
        foregroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          (controller.isEditing.value) ? "Edit Product" : "Add New Product",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(
              () =>
                  (controller.working.value)
                      ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColorLight,
                      )
                      : IconButton(
                        onPressed: () {
                          controller.onCheckPressed();
                        },
                        icon: Icon(Icons.check),
                      ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: InkWell(
                      onTap: controller.onImagePressed,
                      child: Obx(
                        () =>
                            (controller.imageBytes.value == null)
                                ? DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.containerBGColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 50,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                  ),
                                )
                                : Image.memory(
                                  controller.imageBytes.value!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: controller.imageUpload,
                        child: Text("Upload Image"),
                      ),
                      TextButton(
                        onPressed: () => controller.imageBytes.value = null,
                        child: Text("Delete Image"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              CustomTextFiled(
                controller: controller.nameController,
                label: "ProductName",
                hint: "name",
              ),
              SizedBox(height: 12),
              CustomTextFiled(
                keyboardType: TextInputType.number,
                controller: controller.priceController,
                label: "Price",
                hint: "500",
              ),
              SizedBox(height: 12),
              CustomTextFiled(
                controller: controller.descriptionController,
                maxLines: 4,
                label: "Product Description",
                hint: "description",
              ),
              SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width - 100,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.containerBGColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextFiled(
                              controller: controller.variationNameController,
                              label: "Variation Name",
                              hint: "std",
                            ),
                            SizedBox(height: 8),
                            CustomTextFiled(
                              controller: controller.variationCostController,
                              label: "Extra charges on variation",
                              hint: "0.0",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  FloatingActionButton(
                    backgroundColor: AppColors.primaryColorLight,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    onPressed: controller.onAddVariationPressed,
                    child: Icon(Icons.add),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Obx(
                () =>
                    (controller.variations.isNotEmpty)
                        ? Column(
                          children: [
                            Text(
                              " Variations",
                              style: AppFontsStyle.mediumHeadingBold(context),
                            ),
                            SizedBox(height: 8),
                            ...List.generate(controller.variations.length, (i) {
                              final variant = controller.variations[i];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      variant.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${variant.extraAmount}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.variations.removeAt(i);
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        )
                        : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
