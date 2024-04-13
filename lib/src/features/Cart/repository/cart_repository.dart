import 'package:flutter/material.dart';

import '../../../services/local_storage_service.dart';
import '../model/cart_model.dart';

class CartRepository {
  final CartLocalStorageService _localStorageService =
      CartLocalStorageService();

  Future<List<CartModel>> getCartItems() async {
    try {
      return await _localStorageService.getCartItems();
    } catch (e) {
      debugPrint('Error fetching cart items: $e');
      return [];
    }
  }

  Future<CartModel> addToCart({
    required CartModel cartItem,
  }) async {
    try {
      await _localStorageService.addToCart(cartItem);
      return cartItem;
    } catch (e) {
      debugPrint('Error adding to cart: $e');
      rethrow;
    }
  }

  // Future<CartModel> updateCart({
  //   required CartModel cartItem,
  // }) async {
  //   try {
  //     await _localStorageService.updateCartItem(cartItem);
  //     print(cartItem);
  //     return cartItem;
  //   } catch (e) {
  //     debugPrint('Error adding to cart: $e');
  //     rethrow;
  //   }
  // }

  Future<void> removeFromCart({
    required String productId,
  }) async {
    try {
      await _localStorageService.removeFromCart(productId);
    } catch (e) {
      debugPrint('Error removing from cart: $e');
    }
  }

  // clear cart
  Future<void> clearCart() async {
    try {
      await _localStorageService.clearCart();
    } catch (e) {
      debugPrint('Error clearing cart: $e');
    }
  }
}
