import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/configs/routes.dart';
import 'package:grocery_app/configs/theme.dart';
import 'package:grocery_app/pages/introPages/intro1.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: "/splash",
      getPages: getPages,
    );
  }
}
