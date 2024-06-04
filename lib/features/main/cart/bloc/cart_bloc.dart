import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          emit(CartLoadingState());
          final List<CartModel> cartList = await _cartRepository.getUserCart();
          emit(CartLoadedState(cartList));
        } else if (event is RemoveFromCartEvent) {
          emit(CartLoadingState());

          await _cartRepository.removeFromCart(productId: event.productId).then(
                (value) => emit(
                  CartItemRemovedState(),
                ),
              );
        } else if (event is DeleteFromCartEvent) {
          emit(CartLoadingState());

          await _cartRepository.deleteFromCart(productId: event.productId).then(
                (value) => emit(
                  CartItemDeletedState(),
                ),
              );
        } else if (event is AddToCartEvent) {
          emit(CartLoadingState());

          await _cartRepository.addToCart(productId: event.productId).then(
                (value) => emit(
                  CartItemAddedState(),
                ),
              );
        } else if (event is CartCountItemEvent) {
          await _cartRepository.countCartItem().then(
                (value) => emit(
                  CartCountState(),
                ),
              );
        }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
