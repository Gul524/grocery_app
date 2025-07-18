import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_admin/admin_controller.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/font_styles.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  late DashboardController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColorDark,
        foregroundColor: Theme.of(context).primaryColorLight,
        title: Text("Admin DashBoard"),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Theme.of(context).primaryColorLight,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Admin Controls",
                  style: AppFontsStyle.largeHeadingBold(context),
                ),
                Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.adminFunction.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: controller.adminFunction[index].onTap,
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
                              controller.adminFunction[index].label,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
