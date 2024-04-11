import 'package:flutter/material.dart';

import '../../../services/locator_service.dart';
import '../../../services/snackbar.dart';
import '../../Product/model/product_model.dart';
import '../model/cart_model.dart';
import '../repository/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  bool _isLoading = false;
  final CartRepository _cartRepository;
  List<CartModel> _cartItems = [];

  CartProvider() : _cartRepository = locator<CartRepository>();
  bool get isLoading => _isLoading;
  List<CartModel> get cartItems => _cartItems;

  Future<void> addToCart({
    required String productId,
    required ProductModel product,
    required int quantity,
    required BuildContext context,
  }) async {
    _isLoading = true;
    try {
      final existingCartItem = _cartItems.firstWhere(
        (cartItem) => cartItem.product?.id.toString() == productId,
        orElse: () => CartModel(),
      );

      if (existingCartItem.product?.id != null &&
          existingCartItem.quantity != null) {
        print('product already added');
        Snackbar.warning(
          context: context,
          message: 'Product alraady added to cart',
        );
        // existingCartItem.quantity = (existingCartItem.quantity ?? 0) + quantity;
        await _cartRepository.updateCart(cartItem: existingCartItem);
      } else {
        final cartItem = CartModel(
          id: productId,
          product: product,
          quantity: quantity,
        );
        _cartItems.add(cartItem);
        await _cartRepository.addToCart(cartItem: cartItem);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  Future<void> removeFromCart(
      {required BuildContext context, required String productId}) async {
    await _cartRepository.removeFromCart(productId: productId);
    getCartItems();
    print('product removed');
    notifyListeners();
  }

  Future<List<CartModel>> getCartItems() async {
    _cartItems = await _cartRepository.getCartItems();
    return _cartItems;
  }
}
