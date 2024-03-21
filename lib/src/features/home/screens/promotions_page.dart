import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/appbar.dart';

import '../../../core/app_colors.dart';
import '../widgets/promotion_card.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
        implyLeading: true,
        centerTitle: true,
        title: 'Promotion',
        actionConfig: AppBarActionConfig.messageAndNotification,
        actionColor: AppColors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const PromotionsCard(promotionImage: '');
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
          ),
        ),
      ),
    );
  }
}
