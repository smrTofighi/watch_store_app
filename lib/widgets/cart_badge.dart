import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/gen/assets.gen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key, this.count = 0}) : super(key: key);
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
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        Visibility(
          visible: count > 0 ? true : false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
