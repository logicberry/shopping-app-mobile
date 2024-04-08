import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Profile/controller/user_controller.dart';

import '../../../core/core.dart';
import '../widget/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
        final textTheme = Theme.of(context).textTheme;

    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return FutureBuilder<void>(
          future: userProvider.viewProfile(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final user = userProvider.user;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200.h,
                      decoration:
                          const BoxDecoration(color: AppColors.primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              leading: CircleAvatar(
                                radius: 25.r,
                                backgroundImage:
                                    const AssetImage(ImagePath.logo),
                              ),
                              title: Text(
                                user.name!,
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                              subtitle: Text(
                                user.phone!,
                                style: textTheme.bodyLarge
                                    ?.copyWith(color: AppColors.grey),
                              ),
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
                                  balanceText: '800 Points',
                                  balancdTextColor: AppColors.secondaryColor,
                                ),
                              ],
                            ),
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
                            onTap: () => context.pushNamed(
                                RouteConstants.editProfile,
                                extra: user),
                          ),
                          Space.height(10),
                          ProfileCard(
                            title: 'Notifications',
                            icon: SvgPath.notification,
                            description: 'Manage your notifications',
                            onTap: () =>
                                context.pushNamed(RouteConstants.notification),
                          ),
                          Space.height(10),
                          ProfileCard(
                            title: 'Promotions',
                            icon: SvgPath.promo,
                            description: 'View and manage promotions',
                            onTap: () =>
                                context.pushNamed(RouteConstants.promotions),
                          ),
                          Space.height(10),
                          ProfileCard(
                            title: 'Theme',
                            icon: SvgPath.help,
                            description: 'Change your theme',
                            onTap: () =>
                                context.pushNamed(RouteConstants.theme),
                          ),
                          Space.height(10),
                          ProfileCard(
                            title: 'Change Password',
                            icon: SvgPath.settings,
                            description: 'Change your password',
                            onTap: () => context
                                .pushNamed(RouteConstants.changePassword),
                          ),
                          Space.height(10),
                        ])),
                  ],
                ),
              );
            }
          });
    });
  }
}
