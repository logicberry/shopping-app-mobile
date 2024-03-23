import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/features/Profile/widget/profile_card.dart';

import '../../../components/appbar.dart';
import '../../../core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.ash,
        appBar: const SHAppBar(
          title: 'Home',
          actionConfig: AppBarActionConfig.allActions,
          background: AppColors.primaryColor,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.h,
                decoration: const BoxDecoration(color: AppColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.white)),
                        subtitle: Text('+2341234567',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
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
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProfileCard();
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
