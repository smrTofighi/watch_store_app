part of 'product_single_bloc.dart';

sealed class ProductSingleEvent extends Equatable {
  const ProductSingleEvent();

  @override
  List<Object> get props => [];
}
class ProductSingleInitEvent extends ProductSingleEvent{
  final id;
  const ProductSingleInitEvent({required this.id});
}