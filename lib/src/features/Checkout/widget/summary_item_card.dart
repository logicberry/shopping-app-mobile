import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SummaryItemCard extends StatelessWidget {
  final String productName, productPrice, productquantity;
  const SummaryItemCard({super.key, required this.productName, required this.productPrice, required this.productquantity});

  @override
  Widget build(BuildContext context) {
            final textTheme = Theme.of(context).textTheme;

    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
            image: AssetImage(ImagePath.welcome),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(productName, style: textTheme.bodyLarge),
      subtitle: Text('\$$productPrice',
          style: textTheme.bodySmall
              ?.copyWith(color: AppColors.primaryColor)),
      trailing: Text('Quantity $productquantity', style: textTheme.labelSmall),
    );
  }
}
