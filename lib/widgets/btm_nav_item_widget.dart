import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/extension.dart';
import '../components/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.text,
    required this.iconSvgPath,
    required this.isActive,
    required this.onTap
  });
  final String text;
  final String iconSvgPath;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        color: LightAppColor.bottomNavBG,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            iconSvgPath,
            colorFilter: ColorFilter.mode(
                isActive
                    ? LightAppColor.bottomNavActive
                    : LightAppColor.bottomNavDeActive,
                BlendMode.srcIn),
          ),
          AppDimens.small.height,
          Text(
            text,
            style: isActive
                ? LightAppTextStyles.bottomNavActive
                : LightAppTextStyles.bottomNavDeActive,
          )
        ]),
      ),
    );
  }
}
