import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_app/components/text_style.dart';
import 'package:watch_store_app/data/model/user_model.dart';
import 'package:watch_store_app/features/registeration/cubit/register_cubit.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/utils/image_handler.dart';
import 'package:watch_store_app/widgets/app_text_filed_widget.dart';
import 'package:watch_store_app/widgets/avatar_widget.dart';
import 'package:watch_store_app/widgets/main_button_widget.dart';
import 'package:watch_store_app/components/extension.dart';

import '../../../widgets/registeration_app_bar.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();

  final ImageHandler imageHandler = ImageHandler();
  double lat = 0.0;
  double lng = 0.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: RegisterationAppBar(size: size),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: Column(
                children: [
                  AppDimens.large.height,
                  Avatar(
                    onTap: () async {
                      await imageHandler
                          .pickAndcropImage(source: ImageSource.gallery)
                          .then((value) {
                        setState(() {});
                      });
                    },
                    file: imageHandler.getImage,
                  ),
                  AppTextField(
                    lable: AppString.nameLastName,
                    hint: AppString.hintNameLastName,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppString.homeNumber,
                    hint: AppString.hintHomeNumber,
                    controller: _controllerPhone,
                  ),
                  AppTextField(
                    lable: AppString.address,
                    hint: AppString.hintAddress,
                    controller: _controllerAddress,
                  ),
                  AppTextField(
                    lable: AppString.postalCode,
                    hint: AppString.hintPostalCode,
                    controller: _controllerPostalCode,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLocationPickedState) {
                        if (state.location != null) {
                          _controllerLocation.text =
                              '${state.location!.latitude} - ${state.location!.longitude}';
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickTheLocation(context: context);
                        },
                        child: AppTextField(
                          lable: AppString.location,
                          hint: AppString.hintLocation,
                          controller: _controllerLocation,
                          icon: const Icon(Icons.location_on),
                        ),
                      );
                    },
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterOkResponseState) {
                        Navigator.pushNamed(context, ScreensName.mainScreen);
                      } else if (state is RegisterErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('خطایی رخ داده است'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return MainButton(
                          text: AppString.next,
                          onPressed: () async {
                            UserModel userModel = UserModel(
                              name: _controllerNameLastName.text,
                              phone: _controllerPhone.text,
                              address: _controllerAddress.text,
                              postalCode: _controllerPostalCode.text,
                              lat: lat.toString(),
                              lng: lng.toString(),
                              image: await MultipartFile.fromFile(
                                imageHandler.getImage!.path,
                              ),
                            );
                            BlocProvider.of<RegisterCubit>(context).register(userModel: userModel);
                          },
                        );
                      }
                    },
                  ),
                  AppDimens.large.height
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
