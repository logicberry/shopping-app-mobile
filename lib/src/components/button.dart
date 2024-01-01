import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class SAActionButton extends StatelessWidget {
  const SAActionButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 320.w,
      child: InkWell(
        onTap: onTap,
        child: Card(

          color: AppColors.secondaryColor,
          shape: const StadiumBorder(),
          child: Center(
            child: Text(title, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }
}
