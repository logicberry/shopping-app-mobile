import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/core.dart';

class ColorCard extends StatelessWidget {
  final String title;
  const ColorCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
        width: 66.w,
        child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.13),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          margin: EdgeInsets.zero,
          elevation: 0.1,
          child: Center(child: Text(title, style: textTheme.bodySmall)),
        ));
  }
}
