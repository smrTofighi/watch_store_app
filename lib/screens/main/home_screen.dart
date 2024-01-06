import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';

import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/widgets/category_widget.dart';
import 'package:watch_store_app/widgets/product_item.dart';
import 'package:watch_store_app/widgets/search_appbar.dart';

import '../../widgets/app_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchAppBar(onTap: () {}),
              const AppSilder(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryWidget(
                    title: 'کلاسیک',
                    colors: const [
                      Color.fromARGB(255, 255, 166, 114),
                      Color.fromARGB(255, 255, 227, 200),
                    ],
                    onTap: () {},
                    path: Assets.svg.clasic,
                  ),
                  CategoryWidget(
                    title: 'هوشمند',
                    colors: const [
                      Color.fromARGB(255, 139, 162, 168),
                      Color.fromARGB(255, 223, 238, 245),
                    ],
                    onTap: () {},
                    path: Assets.svg.smart,
                  ),
                  CategoryWidget(
                    title: 'دیجیتال',
                    colors: const [
                      Color(0xFFE183D4),
                      Color(0xFFFFE6F5),
                    ],
                    onTap: () {},
                    path: Assets.svg.digital,
                  ),
                  CategoryWidget(
                    title: 'رومیزی',
                    colors: const [
                      Color(0xFF8396E1),
                      Color(0xFFE6FCFF),
                    ],
                    onTap: () {},
                    path: Assets.svg.desktop,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) => index == 0
                      ? const VerticalText()
                      : const ProductItem(
                          title: 'ساعت مردانه طرح فراری',
                          price: 2500000,
                          discount: 20,
                          oldPrice: 3520000,
                          time: 36000,
                        ),
                ),
              ),
              (AppDimens.large * 3.5).height
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svg.back),
                AppDimens.medium.width,
                Text('مشاهده همه'),
              ],
            ),
            AppDimens.medium.height,
            const Text(
              'شگفت انگیز',
              style: LightAppTextStyles.amazing,
            )
          ],
        ),
      ),
    );
  }
}
