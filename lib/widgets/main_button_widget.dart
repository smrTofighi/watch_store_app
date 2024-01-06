import 'package:flutter/material.dart';
import 'package:watch_store_app/components/button_style.dart';

import '../components/text_style.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.75,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.mainButtonStyle,
        child: Text(
          text,
          style: LightAppTextStyles.buttonText,
        ),
      ),
    );
  }
}
