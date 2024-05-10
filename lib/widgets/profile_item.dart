import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/res/dimens.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: LightAppTextStyles.title,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.right,
          ),
        ),
        AppDimens.small.width,
        SvgPicture.asset(icon),
      ],
    );
  }
}
