import 'package:flutter/material.dart';

class LightAppColor {
  LightAppColor._();
  static const Color primary = Colors.blue;

  static const Color title = Colors.black;
  static const Color shadow = Color.fromARGB(90, 0, 0, 0);
  static const Color hint = Color.fromARGB(255, 217, 220, 228);
  static const Color appBar = Colors.white;
  static const Color searchBar = Colors.white;
  static const Color focusedTextField = Colors.white;
  static const Color unfocusedTextField = Color.fromARGB(255, 251, 251, 251);
  static const Color border = Color.fromARGB(255, 217, 220, 228);
  static const Color focusedBorder = Color.fromARGB(255, 0, 117, 251);
  static const Color button = Color.fromARGB(255, 0, 117, 251);
  static const Color surface = Color.fromARGB(255, 243, 243, 243);
  static const Color scaffoldBG = Color.fromARGB(255, 251, 251, 251);
  static const Color bottomNavBG = Color.fromARGB(255, 255, 255, 255);
  static const Color amazingColor = Color.fromARGB(255, 57, 24, 80);

  static const Color bottomNavActive = Colors.black;
  static const Color bottomNavDeActive = Color.fromARGB(255, 196, 196, 196);
}

class GradientColors {
  GradientColors._();
  static const List<Color> colors1 = [
    Color.fromARGB(255, 255, 166, 114),
    Color.fromARGB(255, 255, 227, 200),
  ];
  static const List<Color> colors2 = [
    Color.fromARGB(255, 139, 162, 168),
    Color.fromARGB(255, 223, 238, 245),
  ];
  static const List<Color> colors3 = [
    Color(0xFFE183D4),
    Color(0xFFFFE6F5),
  ];
  static const List<Color> colors4 = [
    Color(0xFF8396E1),
    Color(0xFFE6FCFF),
  ];

  static List colorList= [
    colors1,
    colors2,
    colors3,
    colors4,
  ];
}
