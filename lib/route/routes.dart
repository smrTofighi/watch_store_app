import 'package:flutter/material.dart';
import 'package:watch_store_app/features/main/main_screen.dart';
import 'package:watch_store_app/features/product/product_list_screen.dart';
import 'package:watch_store_app/features/product/product_single_screen.dart';
import 'package:watch_store_app/features/registeration/screens/register_screen.dart';
import '../features/auth/screens/verify_code_screen.dart';
import '../features/auth/screens/send_code_screen.dart';
import 'names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreensName.sendCodeScreen: (context) => SendCodeScreen(),
  ScreensName.verifyCodeScreen: (context) => VerifyCodeScreen(),
  ScreensName.registerScreen: (context) => RegisterScreen(),
  ScreensName.mainScreen: (context) => const MainScreen(),
  ScreensName.productListScreen: (context) => const ProductListScreen(),
  ScreensName.productSingleScreen: (context) => const ProductSingleScreen(),

};

