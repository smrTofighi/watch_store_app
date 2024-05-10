import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/profile_item.dart';
import 'package:watch_store_app/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppString.profile,
              style: LightAppTextStyles.title,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.large.height,
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(Assets.png.avatar.path),
              ),
              AppDimens.medium.height,
              Text(
                'سیدمحمد رضاتوفیقی',
                style: LightAppTextStyles.avatarText,
              ),
              AppDimens.medium.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppString.activeAddress,
                    style: LightAppTextStyles.title,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.svg.leftArrow),
                      Expanded(
                        child: Text(
                          AppString.lurem,
                          style: LightAppTextStyles.title.copyWith(height: 1.5),
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  AppDimens.small.height,
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: LightAppColor.surface,
                  ),
                  AppDimens.small.height,
                  ProfileItem(
                    title: '5859552142',
                    icon: Assets.svg.postalCode,
                  ),
                  ProfileItem(
                    title: '09226911152',
                    icon: Assets.svg.phone,
                  ),
                  ProfileItem(
                    title: 'سیدمحمد رضاتوفیقی',
                    icon: Assets.svg.postalCode,
                  ),
                  SurfaceContainer(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'قوانین و مقررات',
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
