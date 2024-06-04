import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();

  Future<int> addToCart({required int productId});

  Future<void> removeFromCart({required int productId});

  Future<int> deleteFromCart({required int productId});

  Future countCartItem();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;
  static const String productIdKey = 'product_id';

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartList = [];
    final response = await httpClient.post(EndPoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var product in (response.data['data']['user_cart'] as List)) {
      cartList.add(CartModel.fromJson(product));
    }
    return cartList;
  }

  @override
  Future<int> addToCart({required int productId}) async =>
      await httpClient.post(EndPoints.addToCart,
          data: {productIdKey: productId}).then((value) {
        HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        log(value.data.toString());
        return (value.data['data']['user_cart'] as List).length;
      });

  @override
  Future<void> removeFromCart({required int productId}) async {
    await httpClient
        .post(EndPoints.addToCart, data: {productIdKey: productId}).then(
      (value) => HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0),
    );
  }

  @override
  Future<int> deleteFromCart({required int productId}) async => await httpClient
          .post(EndPoints.addToCart, data: {productIdKey: productId}).then(
        (value) {
          HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0);
          return (value.data['data']['user_cart'] as List).length;
        },
      );
      
        @override
        Future countCartItem() async{
         final response = await httpClient.post(EndPoints.userCart);
         HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
         return (response.data['data']['user_cart'] as List).length;
        }
}
