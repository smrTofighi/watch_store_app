
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/model/user_model.dart';
import 'package:watch_store_app/utils/shared_preferences_constants.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Dio _dio = Dio();
  pickTheLocation({required context}) async {
    await showSimplePickerLocation(
      isDismissible: true,
      title: 'انتخاب موقعیت مکانی',
      textCancelPicker: 'لغو',
      textConfirmPicker: 'تایید',
      zoomOption: const ZoomOption(initZoom: 8),
      //initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.3747324),
      radius: 8.0,

      context: context,
    ).then((value) => emit(RegisterLocationPickedState(location: value)));
  }

  register({required UserModel userModel}) async {
    emit(RegisterLoadingState());
    try {
      String? token = SharedPreferencesManager()
          .getString(SharedPreferencesConstants.token);
      _dio.options.headers['Authorization'] = 'Bearer $token';
      await _dio
          .post(
        EndPoints.register,
        data: FormData.fromMap(
          userModel.toMap(),
        ),
      )
          .then((value) {
            log(value.toString());
        if (value.statusCode == 201) {
          emit(RegisterOkResponseState());
        } else {
          emit(RegisterErrorState());
        }
      });
    } catch (e) {
      emit(RegisterErrorState());
    }
  }
}
