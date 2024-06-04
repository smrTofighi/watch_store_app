import 'package:flutter/material.dart';
import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/src/cart_data_src.dart';

abstract class ICartRepository {
  Future<List<CartModel>> getUserCart();
  Future<int> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<int> deleteFromCart({required int productId});
  Future<int> countCartItem();
}

class CartRepository implements ICartRepository {
  final ICartDataSrc _cartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);
  CartRepository(this._cartDataSrc);
  @override
  Future<List<CartModel>> getUserCart() => _cartDataSrc.getUserCart();

  @override
  Future<int> addToCart({required int productId}) =>
      _cartDataSrc.addToCart(productId: productId).then(
            (value) => cartCount.value = value,
          );

  @override
  Future<int> deleteFromCart({required int productId}) =>
      _cartDataSrc.deleteFromCart(productId: productId).then(
            (value) => cartCount.value = value,
          );

  @override
  Future<void> removeFromCart({required int productId}) =>
      _cartDataSrc.removeFromCart(productId: productId);
      
        @override
        Future<int> countCartItem() => _cartDataSrc.countCartItem().then((value) => cartCount.value = value);
        
}

final CartRepository cartRepository =
    CartRepository(CartRemoteDataSrc(DioManager.dio));
