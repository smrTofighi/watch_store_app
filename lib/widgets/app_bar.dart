import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, required this.child}) : super(key: key);
  @override
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
              color: LightAppColor.appBar,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(AppDimens.medium),
                bottomLeft: Radius.circular(AppDimens.medium),
              ),
              boxShadow: [
                BoxShadow(
                    color: LightAppColor.shadow,
                    blurRadius: 3,
                    offset: Offset(0, 2))
              ]),
          child: child,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}