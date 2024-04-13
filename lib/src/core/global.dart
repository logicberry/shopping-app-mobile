import 'package:flutter/material.dart';
import 'package:shopapp/src/core/core.dart';

class BaseRepository {
  void showInternalServerError(BuildContext context) {
    debugPrint('Internal Server Error');
    Snackbar.show(
      context: context,
      message: 'Something went wrong.',
      isError: true,
    );
  }
}
