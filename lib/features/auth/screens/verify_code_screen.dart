import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/features/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/features/auth/cubit/timer_cubit.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/components/extension.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_text_filed_widget.dart';
import 'package:watch_store_app/widgets/main_button_widget.dart';

// ignore: must_be_immutable
class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  late Timer _timer;
  int _start = 120;
  @override
  void initState() {
    BlocProvider.of<TimerCubit>(context).startTimer(context);
    //startTimer();
    super.initState();
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Navigator.of(context).pop();
        } else {
          _start--;
        }
      });
    });
  }

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;

    String minString = min.toString().padLeft(2, '0');
    String secString = sec.toString().padLeft(2, '0');
    return '$minString:$secString';
  }

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
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
              AppDimens.medium.height,
              Text(
                AppString.otpCodeSendFor
                    .replaceAll(AppString.replace, mobileRouteArg),
                style: LightAppTextStyles.title,
              ),
              AppDimens.small.height,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AppString.wrongNumberEditNumber,
                  style: LightAppTextStyles.primaryStyle,
                ),
              ),
              AppDimens.large.height,
              BlocBuilder<TimerCubit, TimerState>(
                builder: (context, state) {
                  return AppTextField(
                    lable: AppString.enterVerificationCode,
                    prefixLable: state is TimerStartState
                        ? formatTime(state.seconds)
                        : state is TimerStartState
                            ? formatTime(120)
                            : '',
                    hint: AppString.hintVerificationCode,
                    controller: _controller,
                  );
                },
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                 
                  if (state is AuthVerifiedNotRegisteredState) {
                    Navigator.pushNamed(context, ScreensName.registerScreen);
                    
                  } else if (state is AuthVerifiedIsRegisteredState) {
                    Navigator.pushNamed(context, ScreensName.mainScreen);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MainButton(
                      text: AppString.next,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyCode(mobileRouteArg, _controller.text);
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
