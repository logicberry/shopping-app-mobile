// ENDPOINTS

class ApiEndpoints {
  static const baseUrl = 'http://10.0.2.2:8000/';

  // AUTHENTICATION ENDPOINTS
  static const auth = 'auth/';
  static const register = '$baseUrl${auth}register';
  static const login = '$baseUrl${auth}login';

  // USER ENDPOINTS
  static const user = 'users/';
  static const viewProfile = '$baseUrl$user';
  static const updateProfile = '$baseUrl${user}update';
  static const changePassword = '$baseUrl${user}change-password';

  // PRODUCT ENDPOINTS
  static const product = 'product/';
  static const getAllProducts = '$baseUrl${product}get';
  static const getSingleProduct = '$baseUrl${product}getProductById';
  static const getProdctByCategory = '$baseUrl${product}getByCategory';
}
