// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../../../core/core.dart';
import '../../../services/local_storage_service.dart';

class ProductRepository {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<List<ProductModel>> getAllProducts({
    required BuildContext context,
  }) async {
    try {
      final String? token = await _localStorageService.getToken();
      final response = await ApiHelper.get(ApiEndpoints.getAllProducts, token!);
      final List<dynamic> productList = response as List<dynamic>;
      final List<ProductModel> products = productList
          .map((productMap) => ProductModel.fromMap(productMap))
          .toList();

      print(products);
      return products;
    } catch (e) {
      debugPrint('Error fetching products: $e');
      rethrow;
    }
  }

  Future<dynamic> getProductByCategory({
    required BuildContext context,
  }) async {
    try {
      final String? token = await _localStorageService.getToken();

      final response =
          await ApiHelper.get(ApiEndpoints.getProdctByCategory, token!);
      return response;
    } catch (e) {
      debugPrint('Error fetching product: $e');
    }
  }
}
