import 'package:flutter/material.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_text_filed_widget.dart';
import 'package:watch_store_app/widgets/main_button_widget.dart';

// ignore: must_be_immutable
class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              AppDimens.large.height,
              AppTextField(
                lable: AppString.enterYourNumber,
                hint: AppString.hintPhoneNumber,
                controller: _controller,
              ),
              MainButton(
                text: AppString.next,
                onPressed: () {
                  Navigator.pushNamed(context, ScreensName.getOtpScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
