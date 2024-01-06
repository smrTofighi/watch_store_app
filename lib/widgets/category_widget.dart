import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.path,
  });
  final String title;
  final Function() onTap;
  final List<Color> colors;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.small / 2),
            margin: const EdgeInsets.all(AppDimens.small),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.large),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
            ),
            child: SvgPicture.asset(path),
          ),
          (AppDimens.small / 2).height,
          Text(
            title,
            style: LightAppTextStyles.title,
          )
        ],
      ),
    );
  }
}
