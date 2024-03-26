import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/feed_card.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      ),
    );
  }
}
