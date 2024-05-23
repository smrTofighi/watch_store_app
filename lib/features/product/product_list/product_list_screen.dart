import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/data/repository/product_repository.dart';
import 'package:watch_store_app/features/product/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.param});
  final dynamic param;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final ProductListBloc productListBloc =
            ProductListBloc(productRepository);
        productListBloc.add(ProductListInitEvent(param: param));
        return productListBloc;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: LightAppColor.scaffoldBG,
            appBar: CustomAppBar(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartBadge(count: 2),
                  Row(
                    children: [
                      Text('پرفروش ترین'),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(Assets.svg.sort)
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.close),
                  ),
                ],
              ),
            )),
            body: Column(
              children: [
                const TagList(),
                BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state is ProductListLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductListLoadedState) {
                      return Expanded(
                        child: GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 0.5),
                          itemBuilder: (context, index) => ProductItem(
                            title: state.products[index].title,
                            id:state.products[index].id ,
                            discount: state.products[index].discount,
                           time: state.products[index].specialExpiration,
                           oldPrice: state.products[index].discountPrice,
                            price: state.products[index].price,
                          ),
                        ),
                      );
                    } else if (state is ProductListErrorState) {
                      return const Text('ERROR');
                    } else {
                      throw Exception('invalid state');
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      height: 24,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.small),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Text(
              'سامسونگ',
              style: LightAppTextStyles.tagTitle,
            ),
          ),
        ),
      ),
    );
  }
}

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 32,
          height: 32,
        ),
        SvgPicture.asset(
          Assets.svg.basket,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        Visibility(
            visible: count == 0 ? false : true,
            child: Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }
}
