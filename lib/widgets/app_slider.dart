import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';

final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
];

class AppSilder extends StatefulWidget {
  const AppSilder({
    super.key,
  });

  @override
  State<AppSilder> createState() => _AppSilderState();
}

class _AppSilderState extends State<AppSilder> {
  final CarouselController carouselController = CarouselController();
  final List<Widget> items = imgList
      .map(
        (e) => Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ClipRRect(
            child: Image.network(
              e,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(AppDimens.medium),
          ),
        ),
      )
      .toList();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          CarouselSlider(
            items: items,
            carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
               setState(() {
                  current = index;
               });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries
                .map((e) => GestureDetector(
                  onTap: () => carouselController.animateToPage(e.key),
                                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == e.key? Colors.black : Colors.grey,
                        ),
                      ),
                ))
                .toList(),
          )
        ],
      ),
    );
  }
}
