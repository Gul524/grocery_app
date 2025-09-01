import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/products/product_add_page.dart';
import 'package:grocery_app/app_admin/products/products/product_controller.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/shared/processing_widget.dart';
import 'package:grocery_app/shared/search_field.dart';

class AdminProductPage extends StatefulWidget {
  static const String name = "/products";
  const AdminProductPage({super.key});

  @override
  State<AdminProductPage> createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
  late AdminProductController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdminProductController());
    controller.selectedCategory = Get.arguments["category"];
    controller.onRefreshPressed();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.selectedCategory?.name ?? "Products"),
        backgroundColor: AppColors.primaryColorDark,
        foregroundColor: Theme.of(context).primaryColorLight,
        actions: [
          Obx(
            () =>
                controller.isEditSide.value
                    ? SizedBox()
                    : IconButton(
                      onPressed:
                          controller.working.value
                              ? null
                              : () {
                                Get.toNamed(
                                  ProductAdditionForm.name,
                                  arguments: {"controller": controller},
                                );
                              },
                      icon: Icon(Icons.add),
                    ),
          ),
          Obx(
            () =>
                controller.isEditSide.value
                    ? IconButton(
                      onPressed:
                          controller.working.value
                              ? null
                              : () {
                                controller.onDeletePressed();
                              },
                      icon: Icon(Icons.delete),
                    )
                    : IconButton(
                      onPressed:
                          controller.working.value
                              ? null
                              : controller.onRefreshPressed,
                      icon: Icon(Icons.restart_alt_rounded),
                    ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(
        () =>
            controller.working.value
                ? ProcessingWidget()
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchField(
                          controller: controller.searchController,
                          onChange: (value) {
                            if (!controller.working.value) {
                              controller.onSearchChanged(value);
                            }
                          },
                          onSettingPress: () {},
                        ),
                      ),

                      // Products count
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Obx(
                          () =>
                              controller.isEditSide.value
                                  ? TextButton(
                                    onPressed:
                                        controller.working.value
                                            ? null
                                            : () {
                                              controller.clearSelections();
                                            },
                                    child: Text("Cancel"),
                                  )
                                  : SizedBox(),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Products list
                      Expanded(
                        child: Obx(
                          () =>
                              controller.filteredProducts.isEmpty
                                  ? Center(
                                    child: Text(
                                      "No products found",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                  : ListView.builder(
                                    itemCount:
                                        controller.filteredProducts.length,
                                    itemBuilder: (context, i) {
                                      final product =
                                          controller.filteredProducts[i];
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Obx(
                                          () => DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Theme.of(
                                                context,
                                              ).primaryColorDark.withAlpha(10),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 20,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              product.name,
                                                              style:
                                                                  AppFontsStyle.mediumHeadingBold(
                                                                    context,
                                                                  ),
                                                            ),
                                                            SizedBox(height: 4),
                                                            Text(
                                                              "Price:Rs ${product.price}",
                                                              style:
                                                                  AppFontsStyle.mediumHeadingBold(
                                                                    context,
                                                                  ),
                                                            ),
                                                            if (product
                                                                .variations
                                                                .isNotEmpty) ...[
                                                              SizedBox(
                                                                height: 4,
                                                              ),
                                                              Text(
                                                                "Variations: ${product.variations.length}",
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color:
                                                                      Colors
                                                                          .grey[600],
                                                                ),
                                                              ),
                                                            ],
                                                          ],
                                                        ),
                                                      ),
                                                      if (controller
                                                          .isEditSide
                                                          .value)
                                                        Obx(
                                                          () => Checkbox(
                                                            value: controller
                                                                .checkDeleteList(
                                                                  product.id,
                                                                ),
                                                            onChanged:
                                                                controller
                                                                        .working
                                                                        .value
                                                                    ? null
                                                                    : (value) {
                                                                      controller.toggleProductSelection(
                                                                        product
                                                                            .id,
                                                                      );
                                                                    },
                                                          ),
                                                        )
                                                      else
                                                        IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .onEditProductPressed(
                                                                  product,
                                                                );
                                                          },
                                                          icon: Icon(
                                                            Icons.edit,
                                                            color:
                                                                Theme.of(
                                                                  context,
                                                                ).primaryColorDark,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  if (product
                                                      .description
                                                      .isNotEmpty) ...[
                                                    Text(
                                                      "Description:",
                                                      style:
                                                          AppFontsStyle.mediumHeadingBold(
                                                            context,
                                                            isBold: false,
                                                          ),
                                                    ),
                                                    Text(
                                                      product.description,
                                                      style:
                                                          AppFontsStyle.smallHeadingBold(
                                                            context,
                                                            isBold: false,
                                                          ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
