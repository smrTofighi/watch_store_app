import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';

import '../res/dimens.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: LightAppColor.primary,
    scaffoldBackgroundColor: LightAppColor.scaffoldBG,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return LightAppColor.focusedTextField;
          } else {
            return LightAppColor.unfocusedTextField;
          }
        }),
        contentPadding: const EdgeInsets.all(AppDimens.medium),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: LightAppColor.border)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: LightAppColor.primary))),
  );
}
