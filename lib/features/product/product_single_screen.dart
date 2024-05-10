import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/features/product/product_list_screen.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/components/extension.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.small),
          child: Row(
            children: [
              const CartBadge(count: 2),
              const Expanded(
                child: Text(
                  'ساعت هوشمند شیائومی',
                  textDirection: TextDirection.rtl,
                  style: LightAppTextStyles.productTitle,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.close),
              ),
            ],
          ),
        )),
        body: SingleChildScrollView(
                  child: Column(
            children: [
              Image.asset(
                Assets.png.unnamed.path,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
              ),
              Container(
                margin: const EdgeInsets.all(AppDimens.medium),
                padding: const EdgeInsets.all(AppDimens.medium),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'ساعت هوشمند',
                      style: LightAppTextStyles.productTitle,
                      textDirection: TextDirection.rtl,
                    ),
                    AppDimens.small.height,
                    Text(
                      'فوق العاده ترین ساعت دنیا در سرزمین ایران',
                      style: LightAppTextStyles.caption,
                      textDirection: TextDirection.rtl,
                    ),
                    const Divider(),
                    ProductTabView(),
                    (AppDimens.large*3).height
                  ],
                ),
              )
            ],
          ),
        ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,

      ),
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({Key? key}) : super(key: key);

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  int selectedTabIndex = 3;
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
            Comments(),
            Review(),
            Features(),
          ],
        )
      ],
    );
  }
}

List<String> tabs = ['نظرات', 'نقد و بررسی', 'خصوصیات'];

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'این محصول قطعا یکی از بهترین ساعت های موجود در ایران است و این محصول قطعا یکی از بهترین ساعت های موجود در ایران است و این محصول قطعا یکی از بهترین ساعت های موجود در ایران است و ');
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
