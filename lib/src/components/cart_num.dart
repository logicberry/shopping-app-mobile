import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class CartAddRemove extends StatelessWidget {
  const CartAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 27.h,
          width: 27.w,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.zero,
            child: const Icon(
              Icons.remove,
              size: 16,
            ),
          ),
        ),
        Space.width(13),
        const Text('1'),
        Space.width(13),
        SizedBox(
          height: 27.h,
          width: 27.w,
          child: Card(
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.zero,
            child: const Icon(
              Icons.add,
              size: 16,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
