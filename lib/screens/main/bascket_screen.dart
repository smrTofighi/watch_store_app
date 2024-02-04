import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/surface_container.dart';
import 'package:watch_store_app/components/extension.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppString.basket,
                style: LightAppTextStyles.title,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppDimens.medium),
              padding: const EdgeInsets.all(AppDimens.medium),
              width: double.infinity,
              height: size.height * 0.1,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 3,
                ),
              ], color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.leftArrow),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppString.sendToAddress,
                          style: LightAppTextStyles.caption,
                        ),
                        FittedBox(
                          child: Text(
                            AppString.lurem,
                            style: LightAppTextStyles.caption,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ShoppingCartItem(
                  count: 3,
                  oldPrice: 500000,
                  price: 400000,
                  productTitle: 'ساعت هوشمند شیائومی',
                ),
                itemCount: 2,
                scrollDirection: Axis.vertical,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem(
      {Key? key,
      required this.count,
      required this.productTitle,
      required this.price,
      required this.oldPrice})
      : super(key: key);
  final int count;
  final String productTitle;
  final int price;
  final int oldPrice;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
        child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                productTitle,
                style: LightAppTextStyles.productTitle,
              ),
              Text(
                'قیمت : ${oldPrice.separateWithComma} تومان',
                style: LightAppTextStyles.caption,
              ),
              Text(
                'با تخفیف : ${price.separateWithComma} تومان',
                style: LightAppTextStyles.caption
                    .copyWith(color: LightAppColor.primary),
              ),
              Divider(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.delete),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.minus),
                  ),
                  Text('$count عدد'),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.plus),
                  ),
                ],
              )
            ],
          ),
        ),
        Image.asset(
          Assets.png.unnamed.path,
          height: 110,
        )
      ],
    ));
  }
}
