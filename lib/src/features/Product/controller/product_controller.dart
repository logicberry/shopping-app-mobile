// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../repository/product_repository.dart';

class ProductProvider with ChangeNotifier {
  bool _isLoading = false;
  final ProductRepository _productRepository;

  ProductProvider(this._productRepository);

  bool get isLoading => _isLoading;

  Future<List<ProductModel>> getAllProducts({
    required BuildContext context,
  }) async {
    _setLoading(true);
    final products = await _productRepository.getAllProducts(context: context);
    _setLoading(false);
    return products;
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    await _productRepository.getProductByCategory(context: context);

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
