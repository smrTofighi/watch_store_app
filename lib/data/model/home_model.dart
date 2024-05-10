import 'package:watch_store_app/data/model/banner_model.dart';
import 'package:watch_store_app/data/model/category_model.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/model/slide_model.dart';

class HomeModel {
  List<SlideModel> sliders;
  List<CategoryModel> categories;
  List<ProductModel> amazingProducts;
  List<ProductModel> mostSelletProducts;
  List<ProductModel> newestProducts;
  BannerModel? banner;

  HomeModel({
    required this.sliders,
    required this.categories,
    required this.amazingProducts,
    required this.mostSelletProducts,
    required this.newestProducts,
     this.banner,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      sliders: (json['sliders'] as List<dynamic>)
          .map((e) => SlideModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      amazingProducts: (json['amazing_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      mostSelletProducts: (json['most_seller_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      newestProducts: (json['newest_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      //banner: BannerModel.fromJson(json['banner']),
    );
  }
}
