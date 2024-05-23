part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();
  
  @override
  List<Object> get props => [];
}

final class ProductListLoadingState extends ProductListState {}
final class ProductListLoadedState extends ProductListState {
  final List<ProductModel> products;
  const ProductListLoadedState(this.products);
}
final class ProductListErrorState extends ProductListState {}
