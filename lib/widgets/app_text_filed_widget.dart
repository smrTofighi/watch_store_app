import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.lable,
    required this.hint,
    required this.controller,
    this.prefixLable = '',
    this.icon = const SizedBox(),
    this.textAlign = TextAlign.center,
    this.inputType,
  });
  final String lable;
  final String prefixLable;
  final String hint;
  TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefixLable),
                Text(lable),
              ],
            ),
          ),
          AppDimens.medium.height,
          SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.75,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
