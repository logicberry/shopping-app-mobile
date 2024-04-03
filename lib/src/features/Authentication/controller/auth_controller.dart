import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/core/core.dart';

import '../repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  bool get isLoading => _isLoading;

  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      await _authRepository.register(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
    } catch (e) {
      // Handle error
      print('Error registering user: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      final response = await _authRepository.login(
        email: email,
        password: password,
      );

      if (response.containsKey('token')) {
        if (context.mounted) {
          context.pushNamed(RouteConstants.nav);
        }
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
      print('Error logging in: $e');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
