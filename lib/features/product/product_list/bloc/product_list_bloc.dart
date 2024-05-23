import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepository _productRepository;
  ProductListBloc(this._productRepository) : super(ProductListLoadingState()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInitEvent) {
        try {
          emit(ProductListLoadingState());
          final List<ProductModel> products =
              await _productRepository.getAllByCategory(event.param);
              emit(ProductListLoadedState(products));
        } catch (e) {
          emit(ProductListErrorState()); 
        }
      }
    });
  }
}
