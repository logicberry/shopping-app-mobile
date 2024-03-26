import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/button.dart';

import '../core/core.dart';

class CartAndCheckoutBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CartAndCheckoutBar({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94.h,
      decoration: BoxDecoration(
        color: AppColors.white,
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
              Text('\$1480.20',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
