import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(AppDimens.medium),
        width: size.width,
        height: 52,
        decoration: BoxDecoration(
          color: LightAppColor.searchBar,
          borderRadius: BorderRadius.circular(60),
          boxShadow: const [
            BoxShadow(
              color: LightAppColor.shadow,
              offset: Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(Assets.svg.search),
            const Text(
              AppString.searchProduct,
              style: LightAppTextStyles.hint,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.png.mainLogo.path),
            ),
          ],
        ),
      ),
    );
  }
}