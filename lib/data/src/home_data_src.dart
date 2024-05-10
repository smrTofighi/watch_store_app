import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IHomeDataSrc {
  Future<HomeModel> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio httpClient;
  HomeRemoteDataSrc(this.httpClient);
  @override
  Future<HomeModel> getHome() async {
    final HomeModel _homeModel;
    final response = await httpClient.get(EndPoints.home);
    
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    _homeModel = HomeModel.fromJson(response.data['data']);
    return _homeModel;
  }
}
