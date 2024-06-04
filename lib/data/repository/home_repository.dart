import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/home_model.dart';
import 'package:watch_store_app/data/src/home_data_src.dart';

abstract class IHomeRepository {
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepository {
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);
  @override
  Future<HomeModel> getHome() => _homeDataSrc.getHome();
}

final HomeRepository homeRepository =
    HomeRepository(HomeRemoteDataSrc(DioManager.dio));
