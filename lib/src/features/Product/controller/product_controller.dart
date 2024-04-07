// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../../../services/locator_service.dart';
import '../repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductProvider() : _productRepository = locator<ProductRepository>();

  Future<List<ProductModel>> getAllProducts({
    required BuildContext context,
  }) async {
    final products = await _productRepository.getAllProducts(context: context);
    return products;
  }

  Future<List<ProductModel>> getProductByCategory({
    required String categoryId,
    required BuildContext context,
  }) async {
    final products = await _productRepository.getProductByCategory(
        context: context, categoryId: categoryId);
    return products;
  }
}
