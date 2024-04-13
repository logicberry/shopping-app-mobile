import 'dart:convert';

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
}

class CartLocalStorageService {
  static const String _cartKey = 'cart';

  Future<void> addToCart(CartModel cartItem) async {
    try {
      // Retrieve existing cart items from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      // Add the new cart item to the list
      cartJsonList.add(jsonEncode(cartItem.toMap()));

      // Save the updated cart items list back to SharedPreferences
      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      // Handle error, if any
      print('Error adding to cart: $e');
      rethrow; // Rethrow the error to propagate it upwards
    }
  }

  Future<List<CartModel>> getCartItems() async {
    try {
      // Retrieve cart items from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      // Convert JSON strings to CartModel objects
      final List<CartModel> cartItems = cartJsonList
          .map((jsonString) => CartModel.fromMap(jsonDecode(jsonString)))
          .toList();

      return cartItems;
    } catch (e) {
      // Handle error, if any
      print('Error fetching cart items: $e');
      rethrow; // Rethrow the error to propagate it upwards
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      // Retrieve existing cart items from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      // Remove the cart item with the specified product ID
      cartJsonList.removeWhere((jsonString) {
        final CartModel cartItem = CartModel.fromMap(jsonDecode(jsonString));
        return cartItem.id == productId;
      });

      // Save the updated cart items list back to SharedPreferences
      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      // Handle error, if any
      print('Error removing from cart: $e');
      rethrow; // Rethrow the error to propagate it upwards
    }
  }

  // Future<void> updateCartItem(CartModel updatedItem) async {
  //   try {
  //     // Retrieve existing cart items from SharedPreferences
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

  //     // Find the index of the item to be updated
  //     final int index = cartJsonList.indexWhere((jsonString) {
  //       final CartModel cartItem = CartModel.fromMap(jsonDecode(jsonString));
  //       return cartItem.id == updatedItem.id;
  //     });

  //     if (index != -1) {
  //       // Update the item at the found index
  //       cartJsonList[index] = jsonEncode(updatedItem.toMap());

  //       // Save the updated cart items list back to SharedPreferences
  //       await prefs.setStringList(_cartKey, cartJsonList);
  //     }
  //   } catch (e) {
  //     // Handle error, if any
  //     print('Error updating cart item: $e');
  //     rethrow; // Rethrow the error to propagate it upwards
  //   }
  // }

  //clear cart
  Future<void> clearCart() async {
    try {
      // Retrieve existing cart items from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      // Clear the cart items list
      cartJsonList.clear();

      // Save the updated cart items list back to SharedPreferences
      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      // Handle error, if any
      print('Error clearing cart: $e');
      rethrow; // Rethrow the error to propagate it upwards
    }
  }
}
