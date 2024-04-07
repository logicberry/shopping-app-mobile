// // cartprovider wuthout repository

// import 'package:flutter/material.dart';
// import 'package:shopapp/src/features/Cart/model/cart_model.dart';
// import 'package:shopapp/src/services/locator_service.dart';

// import '../repository/cart_repository.dart';

// class CartProvider with ChangeNotifier {
//   bool _isLoading = false;
//   final CartRepository _cartRepository;

//   CartProvider() : _cartRepository = locator<CartRepository>();
//   bool get isLoading => _isLoading;

//   Future<List<CartModel>> getCartItems({
//     required BuildContext context,
//   }) async {
//     _setLoading(true);
//     final cartItems = await _cartRepository.getCartItems(context: context);
//     _setLoading(false);
//     return cartItems;
//   }

//   Future<void> addToCart({
//     required String productId,
//     required BuildContext context,
//   }) async {
//     _setLoading(true);
//     await _cartRepository.addToCart(productId: productId, context: context);
//     _setLoading(false);
//   }

//   Future<void> removeFromCart({
//     required String productId,
//     required BuildContext context,
//   }) async {
//     _setLoading(true);
//     await _cartRepository.removeFromCart(
//         productId: productId, context: context);
//     _setLoading(false);
//   }

//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
// }
