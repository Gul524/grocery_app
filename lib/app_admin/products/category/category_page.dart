import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/category/category_controller.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/shared/custom_button.dart';
import 'package:grocery_app/shared/custom_text_filed.dart';
import 'package:grocery_app/shared/info_widget.dart';
import 'package:grocery_app/shared/processing_widget.dart';
import 'package:grocery_app/shared/search_field.dart';

class AdminCategory extends StatefulWidget {
  const AdminCategory({super.key});

  @override
  State<AdminCategory> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends State<AdminCategory> {
  late AdminCategoryController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(AdminCategoryController());
    // controller.onRefreshPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories"),
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
                              : controller.onAddPressed,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () =>
                  controller.working.value
                      ? ProcessingWidget()
                      : SizedBox.shrink(),
            ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () =>
                      (controller.isEditSide.value)
                          ? TextButton(
                            onPressed: () {
                              controller.clearSelections();
                            },
                            child: Text("Cancel"),
                          )
                          : SizedBox.shrink(),
                ),
              ],
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.filteredcategories.length,
                itemBuilder: (context, i) {
                  final category = controller.filteredcategories[i];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap:
                          controller.working.value
                              ? null
                              : () => controller.onCategoryPressed(category),
                      onLongPress:
                          controller.working.value
                              ? null
                              : () => controller.isEditSide.value = true,
                      child: Obx(
                        () => DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColorDark.withAlpha(10),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    category.name,
                                    style: AppFontsStyle.mediumHeadingBold(
                                      context,
                                    ),
                                  ),
                                ),
                                if (controller.isEditSide.value)
                                  Obx(
                                    () => Checkbox(
                                      fillColor: WidgetStatePropertyAll(
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                      ),
                                      activeColor: AppColors.primaryColorDark,
                                      value: controller.checkDeleteList(
                                        category.id,
                                      ),
                                      onChanged:
                                          controller.working.value
                                              ? null
                                              : (value) {
                                                controller
                                                    .toggleCategorySelection(
                                                      category.id,
                                                    );
                                              },
                                    ),
                                  )
                                else
                                  IconButton(
                                    onPressed: () {
                                      controller.onEditCategoryPressed(
                                        category,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCategoryDialog extends StatelessWidget {
  final int? index;
  final AdminCategoryController controller;
  const AddCategoryDialog({super.key, this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8),
                Text(
                  (controller.isEditing.value)
                      ? "Update category Name"
                      : "Insert New Category",
                  style: AppFontsStyle.largeHeadingBold(context, isBold: false),
                ),
                SizedBox(height: 16),
                CustomTextFiled(
                  controller: controller.textcategoryController,
                  label: "Category Name",
                  hint: "Dessart,Drinks,...",
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                ),
                SizedBox(height: 16),

                // Save/Update button with tap prevention
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    label: controller.isEditing.value ? "Update" : "Save",
                    onTap: () {
                      if (!controller.working.value) {
                        if (controller.isEditing.value) {
                          controller.onUpdateCategoryPressed();
                        } else {
                          controller.onSaveCategoryPressed();
                        }
                      }
                    },
                  ),
                ),

                SizedBox(height: 16),
                InfoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
