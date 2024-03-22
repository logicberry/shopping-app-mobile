import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/app_colors.dart';

import '../../../components/button.dart';
import '../../../components/cart_num.dart';
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
            const CartAddRemove(),
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
