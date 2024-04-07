import 'package:shared_preferences/shared_preferences.dart';

import '../features/Cart/model/cart_model.dart';

class LocalStorageService {
  static const String _tokenKey = 'token';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static const String _cartKey = 'cart';

  Future<void> addToCart(CartModel product) async {
    final prefs = await SharedPreferences.getInstance();
    final List<CartModel> cart = await getCartItems();
    cart.add(product); // Add the new product to the cart
    final cartJsonList = cart.map((cartItem) => cartItem.toJson()).toList();
    await prefs.setStringList(_cartKey, cartJsonList);
  }

  Future<List<CartModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJsonList = prefs.getStringList(_cartKey) ?? [];
    return cartJsonList
        .map((cartJson) => CartModel.fromJson(cartJson))
        .toList();
  }

  Future<void> saveProductById(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('productId', productId);
  }

  Future<String?> getProductById(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('productId');
  }
}
