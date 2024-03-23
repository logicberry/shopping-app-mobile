import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: ListTile(
          minLeadingWidth: 35,
          leading: SizedBox(
            height: double.infinity,
            child: SvgPicture.asset(
              SvgPath.cart,
              colorFilter: const ColorFilter.mode(
                  AppColors.secondaryColor, BlendMode.srcIn),
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
          title: Text('User Profile',
              style: Theme.of(context).textTheme.titleSmall),
          subtitle: Text(
            'User profile is here',
            style: Theme.of(context).textTheme.bodySmall,
          )),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final String title, balanceText;
  final Color? balancdTextColor;
  const BalanceCard(
      {super.key,
      required this.title,
      required this.balanceText,
      this.balancdTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 156.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith()),
            Text(balanceText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: balancdTextColor,
                    )),
          ],
        ),
      ),
    );
  }
}
