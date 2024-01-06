import 'package:flutter/material.dart';
import 'package:watch_store_app/screens/main/main_screen.dart';
import 'package:watch_store_app/screens/product/product_list_screen.dart';
import 'package:watch_store_app/screens/product/product_single_screen.dart';
import 'package:watch_store_app/screens/register_screen.dart';


import '../screens/get_otp_screen.dart';
import '../screens/send_otp_screen.dart';
import 'names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreensName.root: (context) => SendOtpScreen(),
  ScreensName.getOtpScreen: (context) => GetOtpScreen(),
  ScreensName.registerScreen: (context) => RegisterScreen(),
  ScreensName.mainScreen: (context) => const MainScreen(),
  ScreensName.productListScreen: (context) => const ProductListScreen(),
  ScreensName.productSingleScreen: (context) => const ProductSingleScreen(),

};

class RegisterUser {
}