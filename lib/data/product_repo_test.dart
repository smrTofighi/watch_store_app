import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/repository/product_repository.dart';
import 'package:watch_store_app/data/src/product_data_src.dart';

class ProductRepoTest{
  final productRepo = ProductRepository(ProductRemoteDataSrc(Dio()));
  getProduct()async=> await productRepo.getSorted(ProductSortRoutes.newestProducts);
}