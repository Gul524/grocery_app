import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/product_controller.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';
import 'package:grocery_app/shared/custom_button.dart';
import 'package:grocery_app/shared/custom_text_filed.dart';
import 'package:grocery_app/shared/info_widget.dart';
import 'package:grocery_app/shared/search_field.dart';

class AdminCategory extends StatefulWidget {
  const AdminCategory({super.key});

  @override
  State<AdminCategory> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends State<AdminCategory> {
  late ProductsController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ProductsController());
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
          IconButton(
            onPressed: () {
              Get.dialog(AddCategoryDialog(controller: controller));
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.restart_alt_rounded),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchField(
                controller: controller.textcategoryController,
                onChange: (value) {},
                onSettingPress: () {},
              ),
            ),

            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.products.length,
                itemBuilder: (context, i) {
                  final category = controller.products[i];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {},
                      child: DecoratedBox(
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
                          child: Text(
                            category.name,
                            style: AppFontsStyle.mediumHeadingBold(
                              context,
                              isBold: false,
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
  final bool isForUpdate;
  final int? index;
  final ProductsController controller;
  const AddCategoryDialog({
    super.key,
    this.isForUpdate = false,
    this.index,
    required this.controller,
  });

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
                  (isForUpdate)
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
                SizedBox(
                  width: 100,
                  child: CustomButton(
                    label: isForUpdate ? "Update" : "Save",
                    onTap: () {
                      if (isForUpdate) {
                      } else {
                        controller.onSaveCategoryPressed();
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
