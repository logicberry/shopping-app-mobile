import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Checks for internet internet
abstract class NetworkInfo {
  Future<bool> hasInternet();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> hasInternet() async {
    try {
      final results = await InternetConnectionChecker().hasConnection;
      return results;
    } on SocketException catch (_) {
      return false;
    }
  }
}
