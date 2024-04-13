// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopapp/src/core/core.dart';
import 'package:shopapp/src/features/Profile/model/user_model.dart';
import '../../../services/services.dart';

class UserRepository extends BaseRepository{
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<UserModel> viewProfile({required BuildContext context}) async {
    try {
      final String? token = await _localStorageService.getToken();
      final dynamic response =
          await ApiHelper.get(ApiEndpoints.viewProfile, token!);
      final UserModel user = UserModel.fromMap(response);
      return user;
    } catch (e) {
      showInternalServerError(context);
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
      showInternalServerError(context);
    }
  }

  Future<void> changePassword(
      {required String oldPassword,
      required String newPassword,
      required BuildContext context}) async {
    final String? token = await _localStorageService.getToken();
    try {
      final response = await ApiHelper.patch(
          ApiEndpoints.changePassword,
          {
            'oldPassword': oldPassword,
            'newPassword': newPassword,
          },
          token!);
      if (response["message"] == "Password Updated successfully") {
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
      showInternalServerError(context);
    }
  }
}
