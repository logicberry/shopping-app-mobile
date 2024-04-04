import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<dynamic> get(String url, String token) async {
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });
    return _response(response);
  }

  static Future<dynamic> post(String url, dynamic body) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return _response(response);
  }

  static Future<dynamic> patch(String url, dynamic body) async {
    final response = await http.patch(
      Uri.parse(url),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return _response(response);
  }

  static Future<dynamic> put(String url, dynamic body) async {
    final response = await http.put(
      Uri.parse(url),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return _response(response);
  }

  static Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse(url));
    return _response(response);
  }

  static dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
      case 403:
        throw Exception('Unauthorised');
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
