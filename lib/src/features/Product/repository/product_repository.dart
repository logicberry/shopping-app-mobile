// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../../../core/core.dart';
import '../../../services/local_storage_service.dart';

class ProductRepository extends BaseRepository {
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

      return products;
    } catch (e) {
      showInternalServerError(context);
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductByCategory({
    required String categoryId,
    required BuildContext context,
  }) async {
    try {
      final String? token = await _localStorageService.getToken();

      final response = await ApiHelper.get(
          '${ApiEndpoints.getProdctByCategory}$categoryId', token!);
      final List<dynamic> productList = response as List<dynamic>;
      final List<ProductModel> products = productList
          .map((productMap) => ProductModel.fromMap(productMap))
          .toList();
      return products;
    } catch (e) {
      showInternalServerError(context);
      rethrow;
    }
  }
}
