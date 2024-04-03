import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../widgets/widgets.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key});

  static List<String> images = [
    ImagePath.promo1,
    ImagePath.promo2,
    ImagePath.promo3,
    ImagePath.promo4,
  ];

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
            itemCount: images.length,
            itemBuilder: (context, index) {
              return PromotionsCard(promotionImage: images[index]);
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
