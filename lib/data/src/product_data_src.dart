import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IProductDataSrc {
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSorted(String routeParam);
  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);
  @override
  Future<List<ProductModel>> getSorted(String routeParam) async{
     List<ProductModel> products = <ProductModel>[];
    final response =
        await httpClient.get(EndPoints.baseUrl + routeParam);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    log(response.data.toString());
    for(var element in (response.data['all_products']['data']as List)){
       products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products = <ProductModel>[];
    final response =
        await httpClient.get(EndPoints.productsByBrand + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for(var element in (response.data['all_products']['data']as List)){
       products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async{
   List<ProductModel> products = <ProductModel>[];
    final response =
        await httpClient.get(EndPoints.productsByCategory + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for(var element in (response.data['all_products']['data']as List)){
       products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> searchProducts(String searchKey)async {
   List<ProductModel> products = <ProductModel>[];
    final response =
        await httpClient.get(EndPoints.baseUrl + searchKey);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for(var element in (response.data['all_products']['data']as List)){
       products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
