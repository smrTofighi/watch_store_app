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

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                itemBuilder: (context, index) => index == 4
                    ? (AppDimens.large * 3.5).height
                    : ShoppingCartItem(
                        count: 3,
                        oldPrice: 500000,
                        price: 400000,
                        productTitle: 'ساعت هوشمند شیائومی',
                      ),
                      
                itemCount: 5,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavCart(),
      ),
    );
  }
}

class BottomNavCart extends StatelessWidget {
  const BottomNavCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppDimens.medium),
      alignment: Alignment.topCenter,
      height: 140,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            offset: Offset(0, -3),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('مجموع 65000 تومان'),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.redAccent),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'ادامه فرایند خرید',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ),
        ],
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
