
import 'package:get/get.dart';
import 'package:grocery_app/pages/home/home_page.dart';
import 'package:grocery_app/pages/splash/splash_page.dart';

List<GetPage> getPages = [
  GetPage(name: "/splash", page: () => SplashPage()),
  // GetPage(name: "/noInternet", page: () => NoInternetPagePage()),
  GetPage(name: "/home", page: () => HomePage())
];