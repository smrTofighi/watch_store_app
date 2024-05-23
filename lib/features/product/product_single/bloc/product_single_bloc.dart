import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/constant.dart';
import 'package:watch_store_app/data/model/product_details_model.dart';
import 'package:watch_store_app/data/repository/product_repository.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepository _productRepository;
  ProductSingleBloc(this._productRepository)
      : super(ProductSingleLoadingState()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInitEvent) {
        
        try {
      
          emit(ProductSingleLoadingState());
       
          final productModel =
              await _productRepository.getProductDetails(event.id);
          emit(ProductSingleLoadedState(productModel));
        } catch (e) {
          log(e.toString());
          emit(ProductSingleErrorState());
        }
      }
    });
  }
}
