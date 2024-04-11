import 'package:flutter/material.dart';

class Snackbar {
  static void show({
    required BuildContext context,
    required String message,
    bool isError = false,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: (isError ? Colors.red : Colors.green),
    ));
  }

  static void warning({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: Colors.orange,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 20,
          left: 20),
    ));
  }
}
