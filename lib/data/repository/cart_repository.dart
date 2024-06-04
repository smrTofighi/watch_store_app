import 'package:watch_store_app/data/model/cart_model.dart';

abstract class ICartRepository {
  Future<List<CartModel>> getUserCart();
  Future<void> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<void> deleteFromCart({required int productId});
}
