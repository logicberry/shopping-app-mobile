import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class SAActionButton extends StatelessWidget {
  const SAActionButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 320.w,
      child: Card(
        color: AppColors.secondaryColor,
        shape: const StadiumBorder(),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.labelLarge),
        ),
      ),
    );
  }
}
