import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/utils/shared_preferences_constants.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    emit(AuthLoggedInState());
  }
  final Dio _dio = Dio();
  sendCode(String mobile) async {
    emit(AuthLoadingState());
    try {
      await _dio
          .post(EndPoints.sendSms, data: {'mobile': mobile}).then((value) {
        log(value.toString());
        if (value.statusCode == 201) {
          emit(AuthSendState(mobile: mobile));
        } else {
          emit(AuthErrorState());
        }
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(AuthLoadingState());
    try {
      await _dio.post(EndPoints.checkSmsCode,
          data: {'mobile': mobile, 'code': code}).then((value) {
        if (value.statusCode == 201) {
          SharedPreferencesManager()
              .saveString(SharedPreferencesConstants.token, value.data['data']['token']);
          if (value.data['data']['is_registered']) {
            emit(AuthVerifiedIsRegisteredState());
          } else {
            emit(AuthVerifiedNotRegisteredState());
          }
        } else {
          emit(AuthErrorState());
        }
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }



  registeration() async {}
  logOut() {}
}
