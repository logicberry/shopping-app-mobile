import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

enum TransactionStatus {
  shipping,
  success,
  notPaid,
}

class TransactionCard extends StatelessWidget {
  final VoidCallback? onTap;
  final TransactionStatus status;

  const TransactionCard({
    super.key,
    required this.status,
    this.onTap,
  });

  Color getStatusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.shipping:
        return AppColors.primaryColor;
      case TransactionStatus.success:
        return AppColors.primaryColor.withOpacity(0.2);
      case TransactionStatus.notPaid:
        return AppColors.red.withOpacity(0.8);
    }
  }

  BorderRadius getStatusBorderRadius(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.shipping:
        return BorderRadius.circular(10.r);
      case TransactionStatus.success:
        return BorderRadius.circular(20.r);
      case TransactionStatus.notPaid:
        return BorderRadius.circular(10.r);
    }
  }

  TextStyle getStatusTextStyle(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.shipping:
        return const TextStyle(color: Colors.white, fontSize: 10);
      case TransactionStatus.success:
        return const TextStyle(color: AppColors.primaryColor, fontSize: 10);
      case TransactionStatus.notPaid:
        return const TextStyle(color: Colors.white, fontSize: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: ListTile(
            isThreeLine: true,
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                image: const DecorationImage(
                  image: AssetImage(ImagePath.welcome),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              'Smart Watch T80',
              style: AppTheme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '\$268.90',
              style: AppTheme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  elevation: 0,
                  color: getStatusColor(status),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      status == TransactionStatus.success ? 20.r : 10.r,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      status == TransactionStatus.shipping
                          ? 'Shipping'
                          : status == TransactionStatus.success
                              ? 'Success'
                              : 'Not Paid',
                      style: getStatusTextStyle(status),
                    ),
                  ),
                ),
                Text('12 September 2023',
                    style:
                        AppTheme.textTheme.labelSmall?.copyWith(fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
