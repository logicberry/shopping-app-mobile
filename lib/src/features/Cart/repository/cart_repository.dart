// import 'package:flutter/material.dart';

// import '../../../services/local_storage_service.dart';
// import '../model/cart_model.dart';

// class CartRepository {
//   final LocalStorageService _localStorageService = LocalStorageService();

//   Future<List<CartModel>> getCartItems({required BuildContext context}) async {
//     // Retrieve the cart items from local storage
//     final cartItemIds = await _localStorageService.getCartItems();
//     // Retrieve product details for each cart item
//     final List<CartModel> cartItems =
//         await Future.wait(cartItemIds.map((id) async {
//       final CartModel product = await _localStorageService.getProductById(id);
//       return product;
//     }));
//     return cartItems;
//   }

//   Future<void> addToCart({
//     required String productId,
//     required BuildContext context,
//   }) async {
//     // Retrieve current cart items from local storage
//     List<String> cartItems = await _localStorageService.getCartItems();
//     // Add the new product ID to the cart
//     cartItems.add(productId);
//     // Save the updated cart to local storage
//     await _localStorageService.saveCartItems(cartItems);
//   }

//   Future<void> removeFromCart({
//     required String productId,
//     required BuildContext context,
//   }) async {
//     // Retrieve current cart items from local storage
//     List<String> cartItems = await _localStorageService.getCartItems();
//     // Remove the product ID from the cart
//     cartItems.remove(productId);
//     // Save the updated cart to local storage
//     await _localStorageService.saveCartItems(cartItems);
//   }
// }
