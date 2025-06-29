import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/colors.dart';
import 'package:grocery_app/configs/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width - 130,
                    child: TextField(
                      cursorColor: AppColors.primaryColorLight,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune_rounded,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        filled: true,
                        isDense: true,
                        hintText: "Search ...",
                        fillColor: Theme.of(context).primaryColorLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: AppColors.primaryColorDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                        child: SizedBox(
                          width: 70,
                          height: 46,
                          child: InkWell(
                            onTap: () {},
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColorDark,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColorLight,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: AppColors.primaryColorDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 4,
                        child: Badge(
                          padding: EdgeInsets.all(4),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textColor: Colors.white,
                          backgroundColor: AppColors.primaryColorDark,
                          label: Text("2"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: Get.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColorDark,
                            AppColors.primaryColorLight,
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 20.0),
                          child: Stack(
                            children: [
                              Text(
                                "Find Your Daily ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Positioned(
                                top: 25,
                                child: Text(
                                  "Grocery",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: Get.width,
                  child: Image.asset(AppImages.fruitDashborad),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
