import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

enum NotificationType {
  paymentSuccessful,
  orderArrived,
  orderDelivery,
}

class NotificationCard extends StatelessWidget {
  final NotificationType type;
  const NotificationCard({super.key, required this.type});

  Color getCircleAvatarColor(NotificationType type) {
    switch (type) {
      case NotificationType.paymentSuccessful:
        return AppColors.primaryColor;
      case NotificationType.orderArrived:
        return AppColors.red.withOpacity(0.5);
      case NotificationType.orderDelivery:
        return AppColors.secondaryColor;
    }
  }

  String getCircleAvatarIcon(NotificationType type) {
    switch (type) {
      case NotificationType.paymentSuccessful:
        return SvgPath.check;
      case NotificationType.orderArrived:
        return SvgPath.feeds;
      case NotificationType.orderDelivery:
        return SvgPath.help;
    }
  }

  String getTitle(NotificationType type) {
    switch (type) {
      case NotificationType.paymentSuccessful:
        return 'Your payment has been successful';
      case NotificationType.orderArrived:
        return 'Your order has arrived';
      case NotificationType.orderDelivery:
        return 'Your order will be delivered home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minVerticalPadding: 5,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: -20,
        leading: CircleAvatar(
          radius: 15.r,
          backgroundColor: getCircleAvatarColor(type),
          child: SvgPicture.asset(
            getCircleAvatarIcon(type),
          ),
        ),
        titleAlignment: ListTileTitleAlignment.top,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getTitle(type),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                Space.height(5)
              ],
            ),
            Text(
              '4 hours',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.blueGrey,
                  ),
            )
          ],
        ),
        subtitle: Text(
          'Consectetur adipiscing elit, sed do eiusmodtempor incididunt u labore',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.blueGrey,
              ),
        ));
  }
}
