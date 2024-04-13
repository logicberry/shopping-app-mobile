import 'dart:convert';

import 'package:flutter/material.dart';
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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      cartJsonList.add(jsonEncode(cartItem.toMap()));
      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      debugPrint('Error adding to cart: $e');
      rethrow;
    }
  }

  Future<List<CartModel>> getCartItems() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      final List<CartModel> cartItems = cartJsonList
          .map((jsonString) => CartModel.fromMap(jsonDecode(jsonString)))
          .toList();

      return cartItems;
    } catch (e) {
      debugPrint('Error fetching cart items: $e');
      rethrow;
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      cartJsonList.removeWhere((jsonString) {
        final CartModel cartItem = CartModel.fromMap(jsonDecode(jsonString));
        return cartItem.id == productId;
      });

      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      debugPrint('Error removing from cart: $e');
      rethrow; // Rethrow the error to propagate it upwards
    }
  }

  // Future<void> updateCartItem(CartModel updatedItem) async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];
  //     final int index = cartJsonList.indexWhere((jsonString) {
  //       final CartModel cartItem = CartModel.fromMap(jsonDecode(jsonString));
  //       return cartItem.id == updatedItem.id;
  //     });

  //     if (index != -1) {
  //       cartJsonList[index] = jsonEncode(updatedItem.toMap());

  //       await prefs.setStringList(_cartKey, cartJsonList);
  //     }
  //   } catch (e) {
  //     print('Error updating cart item: $e');
  //     rethrow; // Rethrow the error to propagate it upwards
  //   }
  // }

  //clear cart
  Future<void> clearCart() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> cartJsonList = prefs.getStringList(_cartKey) ?? [];

      cartJsonList.clear();
      await prefs.setStringList(_cartKey, cartJsonList);
    } catch (e) {
      debugPrint('Error clearing cart: $e');
      rethrow;
    }
  }
}
