import 'package:flutter/material.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = 0,
  });
  final String title;
  final int price;
  final int oldPrice;
  final int discount;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 230, 230, 230),
            Color.fromARGB(255, 255, 255, 255)
          ],
        ),
      ),
      width: 200,
      child: Column(
        children: [
          Image.asset(Assets.png.unnamed.path),
          AppDimens.medium.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: LightAppTextStyles.productTitle,
            ),
          ),
          AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${price.separateWithComma} تومان',
                    style: LightAppTextStyles.title,
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Text(
                      oldPrice.separateWithComma,
                      style: LightAppTextStyles.oldPriceStyle,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small / 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red),
                  child: Text('$discount %'),
                ),
              )
            ],
          ),
          AppDimens.large.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          AppDimens.medium.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Text(
              time.toString(),
              style: LightAppTextStyles.prodTimer,
            ),
          )
        ],
      ),
    );
  }
}
