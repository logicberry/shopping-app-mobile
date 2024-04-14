import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class SAActionButton extends StatelessWidget {
  const SAActionButton({super.key, required this.title, required this.onTap, this.color});

  final String title;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60.h,
      width: 320.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color ?? AppColors.secondaryColor,
          shape: const StadiumBorder(),
          child: Center(
            child: Text(title, style: textTheme.labelLarge),
          ),
        ),
      ),
    );
  }
}
