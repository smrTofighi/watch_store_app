import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/features/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_text_filed_widget.dart';
import 'package:watch_store_app/widgets/main_button_widget.dart';

// ignore: must_be_immutable
class SendCodeScreen extends StatelessWidget {
  SendCodeScreen({Key? key}) : super(key: key);
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSendState) {
                    Navigator.pushNamed(context, ScreensName.verifyCodeScreen,
                        arguments: state.mobile);
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 800),
                        backgroundColor: Colors.red,
                        content: Text('خطایی رخ داده است.'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MainButton(
                      text: AppString.next,
                      onPressed: () {
                       BlocProvider.of<AuthCubit>(context).sendCode(_controller.text);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
