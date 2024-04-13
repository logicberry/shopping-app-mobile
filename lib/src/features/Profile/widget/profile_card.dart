import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ProfileCard extends StatelessWidget {
  final String title, description, icon;
  final VoidCallback? onTap;

  const ProfileCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 69.h,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: ListTile(
            minLeadingWidth: 35,
            leading: SizedBox(
              height: double.infinity,
              child: SvgPicture.asset(
                icon,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              size: 30,
              color: AppColors.grey,
            ),
            title: Text(title, style: textTheme.bodyMedium),
            subtitle: Text(
              description,
              style:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400),
            )),
      ),
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
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 75.h,
      width: 156.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.bodySmall?.copyWith()),
            Text(balanceText,
                style: textTheme.titleLarge?.copyWith(
                  color: balancdTextColor,
                )),
          ],
        ),
      ),
    );
  }
}
