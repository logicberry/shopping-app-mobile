// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/core/core.dart';
import 'package:shopapp/src/features/Profile/model/user_model.dart';
import 'package:shopapp/src/services/local_storage_service.dart';

class UserRepository {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<UserModel> viewProfile({required BuildContext context}) async {
    try {
      final String? token = await _localStorageService.getToken();
      final dynamic response =
          await ApiHelper.get(ApiEndpoints.viewProfile, token!);
      final UserModel user = UserModel.fromMap(response);
      print(user);
      return user;
    } catch (e) {
      debugPrint('Error fecthing user: $e');
      rethrow;
    }
  }

  Future<void> updateProfile(
      {String? fullName,
      String? phoneNumber,
      String? address,
      String? country,
      required BuildContext context}) async {
    final String? token = await _localStorageService.getToken();
    try {
      final response = await ApiHelper.patch(
          ApiEndpoints.updateProfile,
          {
            'name': fullName,
            'phone': phoneNumber,
            'address': address,
            'country': country
          },
          token!);
      print(response);
      if (response["message"] == "User Data Successfully updated") {
        if (context.mounted) {
          Snackbar.show(
            context: context,
            message: response['message'],
          );
        }
      } else {
        Snackbar.show(
            context: context,
            message: response['message'] ?? 'An error occurred',
            isError: true);
      }

      return response;
    } catch (e) {
      debugPrint('Error registering user: $e');
    }
  }
}
