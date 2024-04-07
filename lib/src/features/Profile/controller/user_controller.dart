import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopapp/src/features/Profile/model/user_model.dart';
import 'package:shopapp/src/features/Profile/repository/user_repository.dart';
import 'package:shopapp/src/services/locator_service.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  final UserRepository _userRepository;
  UserModel _user = UserModel();

  UserProvider() : _userRepository = locator<UserRepository>();
  bool get isLoading => _isLoading;
  UserModel get user => _user;

  Future<UserModel> viewProfile({required BuildContext context}) async {
    _user = await _userRepository.viewProfile(context: context);
    return _user;
  }

  Future<void> editProfile(
      {required BuildContext context,
      required String fullName,
      required String phoneNumber,
      required String address,
      required String country}) async {
    _isLoading = true;
    await _userRepository.updateProfile(
        context: context,
        fullName: fullName,
        address: address,
        phoneNumber: phoneNumber,
        country: country);
    _user = UserModel(
      name: fullName,
      phone: phoneNumber,
      address: address,
      country: country,
    );
    _isLoading = false;
    notifyListeners();
  }
}
