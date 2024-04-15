import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class SAActionButton extends StatelessWidget {
  const SAActionButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onTap;
  final Color? color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60.h,
      width: 320.w,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Card(
          color: color ?? AppColors.secondaryColor,
          shape: const StadiumBorder(),
          child: Center(
            child: isLoading
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(title, style: textTheme.labelLarge),
          ),
        ),
      ),
    );
  }
}
