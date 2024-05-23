part of 'product_single_bloc.dart';

sealed class ProductSingleState extends Equatable {
  const ProductSingleState();
  
  @override
  List<Object> get props => [];
}

final class ProductSingleLoadingState extends ProductSingleState {}
final class ProductSingleLoadedState extends ProductSingleState {
  final ProductDetailsModel productModel;
  const ProductSingleLoadedState(this.productModel);  
}
final class ProductSingleErrorState extends ProductSingleState {}
