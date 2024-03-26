import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String company;
  final String productPrice;
  final String initialPrice;
  final Color productBgColor;
  const ProductCard(
      {super.key,
      required this.productName,
      required this.company,
      required this.productPrice,
      required this.initialPrice,
      required this.productBgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(RouteConstants.productDetails),
      child: SizedBox(
        height: 191.h,
        width: 161.w,
        child: Column(
          children: [
            Container(
              height: 97.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: productBgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Image.asset(
                ImagePath.logo,
                fit: BoxFit.scaleDown,
              ),
            ),
            Container(
              height: 94.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              child: Padding(
                padding: EdgeInsets.all(10.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(productName,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Row(
                      children: [
                        Text('$company •',
                            style: Theme.of(context).textTheme.labelSmall),
                        Space.width(10),
                      ],
                    ),
                    Row(
                      children: [
                        Text('\$$productPrice',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.primaryColor)),
                        Space.width(6),
                        Text('\$$initialPrice',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: AppColors.red,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
