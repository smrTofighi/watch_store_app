class EndPoints {
  static const String versionRoute = 'public/api/v1/';
  static const String baseUrl =
      'https://watchstore.sasansafari.com/$versionRoute';

  static const String sendSms = '${baseUrl}send_sms';
  static const String checkSmsCode = '${baseUrl}check_sms_code';
  static const String register = '${baseUrl}register';
  static const String productsByBrand = '${baseUrl}products_by_brand/';
  static const String productsByCategory = '${baseUrl}products_by_category/';
  static const String search = '${baseUrl}all_products/';
  static const String home = '${baseUrl}home';
  static const String productDetails = '${baseUrl}product_details/';
  static const String userCart = '${baseUrl}user_cart';
  static const String addToCart = '${baseUrl}add_to_cart';
  static const String removeFromCart = '${baseUrl}remove_from_cart';
  static const String deleteFromCart = '${baseUrl}delete_from_cart';
}

class ProductSortRoutes{
  static const newestProducts= 'newest_products';
  static const cheapestProducts= 'cheapest_products';
  static const mostExpensiveProducts = 'most_expensive_products';
  static const mostViewedProducts= 'most_viewed_products';

}