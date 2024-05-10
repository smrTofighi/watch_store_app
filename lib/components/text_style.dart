import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';

import '../gen/fonts.gen.dart';

abstract class LightAppTextStyles {
  LightAppTextStyles._();
  static const TextStyle selectedTab = TextStyle(
      fontSize: 14, fontFamily: FontFamily.dana, color: LightAppColor.title);
  static TextStyle unSelectedTab = TextStyle(
      fontSize: 14,
      fontFamily: FontFamily.dana,
      color: LightAppColor.title.withAlpha(125));

  static const TextStyle productTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.normal);
  static const TextStyle btmNavActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: Colors.black,
  );
  static TextStyle caption = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      color: LightAppColor.title.withAlpha(150),
      fontWeight: FontWeight.w300);
  static const TextStyle oldPriceStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough);

  static const TextStyle btmNavInActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: Colors.grey,
  );
  static const TextStyle amazing = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 22,
      color: LightAppColor.amazingColor,
      fontWeight: FontWeight.w700);
  static const TextStyle title = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      color: LightAppColor.title,
      fontWeight: FontWeight.w500);
  static const TextStyle tagTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w700);
  static const TextStyle prodTimer = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: Colors.blue,
      fontWeight: FontWeight.w400);
  static const TextStyle avatarText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColor.title,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColor.hint,
  );
  static const TextStyle bottomNavActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColor.bottomNavActive,
  );
  static const TextStyle bottomNavDeActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColor.bottomNavDeActive,
  );
  static const TextStyle primaryStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColor.primary,
  );
}
