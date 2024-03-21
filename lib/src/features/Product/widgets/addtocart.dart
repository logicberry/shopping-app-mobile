import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/app_colors.dart';

import '../../../components/button.dart';
import '../../../core/dimension.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94.h,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const Text('1'),
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
            Space.width(30),
            SizedBox(
                width: 185.w,
                child: SAActionButton(title: 'Add to Cart', onTap: () {})),
          ],
        ),
      ),
    );
  }
}
