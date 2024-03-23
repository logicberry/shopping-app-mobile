import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/appbar.dart';
import 'package:shopapp/src/features/Feeds/widget/feed_card.dart';

import '../../../core/core.dart';



class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.allActions,
        title: 'Feeds',
        actionColor: AppColors.black,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const FeedCard();
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
        ),
      )),
    );
  }
}
