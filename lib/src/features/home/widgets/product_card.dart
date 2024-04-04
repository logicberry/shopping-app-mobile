import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../services/format.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String company;
  final double productPrice;
  final double initialPrice;
  final Color productBgColor;
  final String image;
  const ProductCard(
      {super.key,
      required this.productName,
      required this.company,
      required this.productPrice,
      required this.initialPrice,
      required this.productBgColor,
      required this.image});

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
                child: Image.network(
                  image,
                )),
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
                    Text(productName, style: AppTheme.textTheme.bodyMedium),
                    Row(
                      children: [
                        Text('$company •',
                            style: AppTheme.textTheme.labelSmall),
                        Space.width(10),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${NumberFormatUtil.formatThousand(productPrice)}',
                          style: AppTheme.textTheme.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Space.width(6),
                        Expanded(
                          child: Text(
                              '\$${NumberFormatUtil.formatThousand(initialPrice)}',
                              style: AppTheme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.red,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.red,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis),
                        )
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
