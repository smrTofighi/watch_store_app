import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/data/repository/home_repository.dart';
import 'package:watch_store_app/features/main/home/bloc/home_bloc.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/widgets/category_widget.dart';
import 'package:watch_store_app/widgets/product_item.dart';
import 'package:watch_store_app/widgets/search_appbar.dart';

import '../../../widgets/app_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeEventInit());
        return homeBloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeStateLoaded) {
                  return Column(
                    children: [
                      SearchAppBar(onTap: () {}),
                      AppSilder(
                        imgList: state.homeModel.sliders,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: state.homeModel.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryWidget(
                            title: state.homeModel.categories[index].title,
                            onTap: () {},
                            colors: GradientColors.colorList[index],
                            path: state.homeModel.categories[index].image,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.homeModel.amazingProducts.length,
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) => index == 0
                              ? const VerticalText()
                              : ProductItem(
                                  title: state
                                      .homeModel.amazingProducts[index].title,
                                  price: state
                                      .homeModel.amazingProducts[index].price,
                                  discount: state.homeModel
                                      .amazingProducts[index].discount,
                                  oldPrice: 3520000,
                                  time: '2024-05-11 00:00:00',
                                ),
                        ),
                      ),
                      (AppDimens.large * 3.5).height
                    ],
                  );
                } else if (state is HomeStateError) {
                  return const Center(
                    child: Text('ERROR'),
                  );
                } else {
                  throw Exception('invalid state');
                }
              },
            ),
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
