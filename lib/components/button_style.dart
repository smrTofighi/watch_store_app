import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(LightAppColor.primary),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.medium),
      ),
    ),
  );
}
