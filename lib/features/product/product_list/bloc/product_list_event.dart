part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInitEvent extends ProductListEvent{
  final dynamic param;
  const ProductListInitEvent({required this.param});
}