import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/data/model/product_details_model.dart';
import 'package:watch_store_app/data/repository/product_repository.dart';
import 'package:watch_store_app/features/product/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/features/product/product_list/product_list_screen.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/components/extension.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productSingleBloc = ProductSingleBloc(productRepository);
        productSingleBloc.add(ProductSingleInitEvent(id: id));
        return productSingleBloc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductSingleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSingleLoadedState) {
            return SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.small),
                  child: Row(
                    children: [
                      const CartBadge(count: 2),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            state.productModel.title ?? '',
                            textDirection: TextDirection.rtl,
                            style: LightAppTextStyles.productTitle,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(Assets.svg.close),
                      ),
                    ],
                  ),
                )),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            state.productModel.image!,
                            fit: BoxFit.cover,
                            //width: MediaQuery.sizeOf(context).width,
                            scale: 1,
                          ),
                          Container(
                            margin: const EdgeInsets.all(AppDimens.medium),
                            padding: const EdgeInsets.all(AppDimens.medium),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.medium),
                              color: const Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  state.productModel.brand!,
                                  style: LightAppTextStyles.productTitle,
                                  textDirection: TextDirection.rtl,
                                ),
                                AppDimens.small.height,
                                Text(
                                  state.productModel.title!,
                                  style: LightAppTextStyles.caption,
                                  textDirection: TextDirection.rtl,
                                ),
                                const Divider(),
                                ProductTabView(
                                  productModel: state.productModel,
                                ),
                                (AppDimens.large * 6).height
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: AppDimens.large,
                      right: AppDimens.large,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: LightAppColor.primary),
                        child: const Text(
                          'افزودن به سبد خرید',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is ProductSingleErrorState) {
            return const Center(child: Text('ERROR'));
          } else {
            throw Exception('invalid');
          }
        },
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key, required this.productModel});
  final ProductDetailsModel productModel;
  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  int selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tabs.length,
            itemExtent: MediaQuery.sizeOf(context).width / tabs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(
                  tabs[index],
                  style: index == selectedTabIndex
                      ? LightAppTextStyles.selectedTab
                      : LightAppTextStyles.unSelectedTab,
                ),
              ),
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
            CommentsList(
              comments: widget.productModel.comments!,
            ),
            Review(
              review: widget.productModel.discussion!,
            ),
            PropertiesList(
              properties: widget.productModel.properties!,
            ),
          ],
        )
      ],
    );
  }
}

List<String> tabs = ['نظرات', 'نقد و بررسی', 'خصوصیات'];

class PropertiesList extends StatelessWidget {
  const PropertiesList({super.key, required this.properties});
  final List<Properties> properties;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: properties.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.medium),
          color: LightAppColor.surface,
          child: Text(
            "${properties[index].property} : ${properties[index].value}",
            style: LightAppTextStyles.caption,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key, required this.review});
  final String review;
  @override
  Widget build(BuildContext context) {
    return Text(review);
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.comments});
  final List<Comments> comments;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: comments.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.medium),
          color: LightAppColor.surface,
          child: Text(
            "${comments[index].user} : ${comments[index].body}",
            style: LightAppTextStyles.caption,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
