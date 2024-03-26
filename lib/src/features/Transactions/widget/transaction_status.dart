import 'package:flutter/material.dart';

void bottomSheet({required context, required screen}) {
  showModalBottomSheet(
    useSafeArea: true,
    enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      builder: (builder) => screen);
}
