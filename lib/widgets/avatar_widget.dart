import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/res/strings.dart';

import '../gen/assets.gen.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.onTap, required this.file});
  final Function() onTap;
  final File? file;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            height: MediaQuery.sizeOf(context).width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child:file == null? Image.asset(Assets.png.avatar.path) : Image.file(file!),
            ),
          ),
          AppDimens.medium.height,
          const Text(AppString.chooseProfileImage)
        ],
      ),
    );
  }
}
