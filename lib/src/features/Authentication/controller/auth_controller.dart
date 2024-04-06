// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../services/locator_service.dart';
import '../repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  final AuthRepository _authRepository;

  bool get isLoading => _isLoading;

  AuthProvider() : _authRepository = locator<AuthRepository>();

  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    await _authRepository.register(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        context: context);
    _setLoading(false);
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    await _authRepository.login(
        email: email, password: password, context: context);
    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
