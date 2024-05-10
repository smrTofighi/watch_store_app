import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            children: [TagList(), ProductGridView()],
          )),
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

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) =>
            const ProductItem(title: 'ساعت شیائومی', price: 1200000),
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
