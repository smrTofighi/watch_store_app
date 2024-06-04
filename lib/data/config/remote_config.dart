import 'package:dio/dio.dart';
import 'package:watch_store_app/utils/shared_preferences_constants.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token =
        SharedPreferencesManager().getString(SharedPreferencesConstants.token);
    if (token != null) {
      //options.headers['Authorization'] = 'Bearer $token';
      options.headers['Authorization'] = 'Bearer 1346|3rXgLULbTyZ9WaRz4kwFdKWDzUsyAF4I9foRuSC0';
    }
    super.onRequest(options, handler);
  }
}

class DioManager{
  static final Dio _dio = Dio();
  static Dio get dio{
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }
}