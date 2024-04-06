// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../../../services/locator_service.dart';
import '../repository/product_repository.dart';

class ProductProvider with ChangeNotifier {
  bool _isLoading = false;
  final ProductRepository _productRepository;

  ProductProvider() : _productRepository = locator<ProductRepository>();
  bool get isLoading => _isLoading;

  Future<List<ProductModel>> getAllProducts({
    required BuildContext context,
  }) async {
    _setLoading(true);
    final products = await _productRepository.getAllProducts(context: context);
    _setLoading(false);
    return products;
  }

  Future<List<ProductModel>> getProductByCategory({
    required String categoryId,
    required BuildContext context,
  }) async {
    _setLoading(true);
    final products = await _productRepository.getProductByCategory(
        context: context, categoryId: categoryId);
    _setLoading(false);
    return products;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
