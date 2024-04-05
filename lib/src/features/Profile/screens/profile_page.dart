import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../widget/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200.h,
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    leading: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: const AssetImage(ImagePath.logo)),
                    title: Text('Malik Rasaq',
                        style: AppTheme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.white)),
                    subtitle: Text('+234123456756',
                        style: AppTheme.textTheme.bodyLarge
                            ?.copyWith(color: AppColors.grey)),
                  ),
                  Space.height(26),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BalanceCard(
                        title: 'Balance',
                        balanceText: '\$809.10',
                        balancdTextColor: AppColors.primaryColor,
                      ),
                      BalanceCard(
                        title: 'My Reward Points',
                        balanceText: '800',
                        balancdTextColor: AppColors.secondaryColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Space.height(10),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                ProfileCard(
                  title: 'User Profile',
                  icon: SvgPath.profile,
                  description: 'View and edit your profile',
                  onTap: () => context.pushNamed(RouteConstants.editProfile),
                ),
                Space.height(10),
                ProfileCard(
                  title: 'Notifications',
                  icon: SvgPath.notification,
                  description: 'Manage your notifications',
                  onTap: () => context.pushNamed(RouteConstants.notification),
                ),
                Space.height(10),
                ProfileCard(
                  title: 'Promotions',
                  icon: SvgPath.promo,
                  description: 'View and manage promotions',
                  onTap: () => context.pushNamed(RouteConstants.promotions),
                ),
                Space.height(10),
                ProfileCard(
                  title: 'About',
                  icon: SvgPath.help,
                  description: 'Learn more about the app',
                  onTap: () {},
                ),
                Space.height(10),
                ProfileCard(
                  title: 'Settings',
                  icon: SvgPath.settings,
                  description: 'Manage your app settings',
                  onTap: () {},
                ),
                Space.height(10),
              ])),
        ],
      ),
    );
  }
}
