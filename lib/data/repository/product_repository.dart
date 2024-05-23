import 'package:dio/dio.dart';
import 'package:watch_store_app/data/model/product_details_model.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/src/product_data_src.dart';

abstract class IProductRepository {
  Future<ProductDetailsModel> getProductDetails(int id);

  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSorted(String routeParam);
  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRepository implements IProductRepository {
  final IProductDataSrc _iProductDataSrc;
  ProductRepository(this._iProductDataSrc);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<ProductModel>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<ProductModel>> getSorted(String routeParam) =>
      _iProductDataSrc.getSorted(routeParam);

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);

  @override
  Future<ProductDetailsModel> getProductDetails(int id) =>
      _iProductDataSrc.getProductDetails(id);
}

final ProductRepository productRepository =
    ProductRepository(ProductRemoteDataSrc(Dio()));
