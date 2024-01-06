import 'package:flutter/material.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_text_filed_widget.dart';
import 'package:watch_store_app/widgets/avatar_widget.dart';
import 'package:watch_store_app/widgets/main_button_widget.dart';
import 'package:watch_store_app/components/extension.dart';

import '../widgets/registeration_app_bar.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  TextEditingController _controllerNameLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: RegisterationAppBar(size: size),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppDimens.large.height,
                const Avatar(),
                AppTextField(
                  lable: AppString.nameLastName,
                  hint: AppString.hintNameLastName,
                  controller: _controllerNameLastName,
                ),
                AppTextField(
                  lable: AppString.homeNumber,
                  hint: AppString.hintHomeNumber,
                  controller: _controllerNameLastName,
                ),
                AppTextField(
                  lable: AppString.address,
                  hint: AppString.hintAddress,
                  controller: _controllerNameLastName,
                ),
                AppTextField(
                  lable: AppString.postalCode,
                  hint: AppString.hintPostalCode,
                  controller: _controllerNameLastName,
                ),
                AppTextField(
                  lable: AppString.location,
                  hint: AppString.hintLocation,
                  controller: _controllerNameLastName,
                  icon: const Icon(Icons.location_on),
                ),
                MainButton(
                  text: AppString.next,
                  onPressed: () {
                    Navigator.pushNamed(context, ScreensName.mainScreen);
                  },
                ),
                AppDimens.large.height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
