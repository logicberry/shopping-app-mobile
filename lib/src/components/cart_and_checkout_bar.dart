import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/button.dart';

import '../core/core.dart';

class CartAndCheckoutBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final String totalPrice;
  const CartAndCheckoutBar(
      {super.key, this.title, this.onTap, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: 94.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(width: 0.3, color: AppColors.grey),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Total Payment',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
              Text('\$$totalPrice',
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  )),
            ]),
            Space.width(5),
            SizedBox(
                width: 185.w,
                child:
                    SAActionButton(title: title ?? 'Continue', onTap: onTap)),
          ],
        ),
      ),
    );
  }
}
