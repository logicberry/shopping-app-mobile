import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 66.w,
        child: Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          margin: EdgeInsets.zero,
          elevation: 2,
          child: const Center(child: Text('Green')),
        ));
  }
}
