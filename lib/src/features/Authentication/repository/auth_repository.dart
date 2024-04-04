// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../services/local_storage_service.dart';

class AuthRepository {
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<dynamic> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await ApiHelper.post(
        ApiEndpoints.register,
        {
          'name': fullName,
          'email': email,
          'phone': phoneNumber,
          'password': password,
        },
      );
      if (response['message'] == 'Registration Successful') {
        if (context.mounted) {
          context.pushNamed(RouteConstants.signIn);
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

  Future<dynamic> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await ApiHelper.post(
        ApiEndpoints.login,
        {
          'email': email,
          'password': password,
        },
      );
      if (response.containsKey('token')) {
        await _localStorageService.saveToken(response['token']);
        if (context.mounted) {
          context.pushNamed(RouteConstants.nav);
        }
      } else {
        Snackbar.show(
            context: context,
            message: response['message'] ?? 'An error occurred',
            isError: true);
      }

      return response;
    } catch (e) {
      debugPrint('Error login user: $e');
    }
  }
}
