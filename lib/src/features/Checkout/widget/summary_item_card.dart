import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SummaryItemCard extends StatelessWidget {
  const SummaryItemCard({super.key});

  @override
  Widget build(BuildContext context) {
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
      title:
          Text('Smart Watch T80', style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text('\$268.90',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.primaryColor)),
      trailing: Text('Quantity', style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
