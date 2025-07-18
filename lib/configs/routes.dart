import 'package:get/get.dart';
import 'package:grocery_app/app_admin/products/category_page.dart';
import 'package:grocery_app/app_admin/dashboard.dart';
import 'package:grocery_app/pages/home/home_page.dart';
import 'package:grocery_app/pages/introPages/intro1.dart';
import 'package:grocery_app/pages/login/loginpage.dart';
import 'package:grocery_app/pages/login/otp_page.dart';
import 'package:grocery_app/pages/splash/splash_page.dart';

List<GetPage> getPages = [
  GetPage(name: "/splash", page: () => SplashPage()),
  // GetPage(name: "/noInternet", page: () => NoInternetPagePage()),
  GetPage(name: "/intro", page: () => IntroPage()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/otp", page: () => OTPPage()),
  GetPage(name: "/home", page: () => HomePage()),
  
  GetPage(name: "/admin", page: () => AdminDashBoard()),
  GetPage(name: "/adminCategory", page: () => AdminCategory()),

];
