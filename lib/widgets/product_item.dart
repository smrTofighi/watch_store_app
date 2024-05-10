import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/utils/format_time.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = '0',
  });
  final String title;
  final int price;
  final int oldPrice;
  final int discount;
  final String time;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = Duration(seconds: 0);
  late Timer _timer;
  late int inSeconds;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    DateTime expiration = DateTime.parse(widget.time);  
    _duration = now.difference(expiration).abs();

    inSeconds = _duration.inSeconds;
    startTimer();
  }
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
              widget.title,
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
                    '${widget.price.separateWithComma} تومان',
                    style: LightAppTextStyles.title,
                  ),
                  Visibility(
                    visible: widget.discount > 0 ? true : false,
                    child: Text(
                      widget.oldPrice.separateWithComma,
                      style: LightAppTextStyles.oldPriceStyle,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: widget.discount > 0 ? true : false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red),
                  child: Text(
                    '${widget.discount} %',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          AppDimens.large.height,
          Visibility(
            visible:_duration.inSeconds >0  ? true : false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          AppDimens.medium.height,
          Visibility(
            visible: _duration.inSeconds >0 ? true : false,
            child: Text(
             formateTime(inSeconds),
              style: LightAppTextStyles.prodTimer,
            ),
          )
        ],
      ),
    );
  }
  
  void startTimer() {
    const onSecond = Duration(seconds: 1);
  _timer = Timer.periodic(onSecond, (timer) {
    setState(() {
      if(inSeconds ==0){
        log('Product onTap Limited');

      }else {
        inSeconds--;
      }
    });
  });
  }
}
