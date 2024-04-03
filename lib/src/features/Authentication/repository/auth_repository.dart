import '../../../core/core.dart';

class AuthRepository {
  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
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
      print(response);
      return response;
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiHelper.post(
        ApiEndpoints.login,
        {
          'email': email,
          'password': password,
        },
      );
      print(response);

      return response;
    } catch (e) {
      print('Error login user: $e');
    }
  }
}
