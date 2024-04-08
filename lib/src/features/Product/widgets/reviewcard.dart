import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/rating.dart';

import '../../../core/core.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
            final textTheme = Theme.of(context).textTheme;

    return ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: -20,
        leading: CircleAvatar(
          radius: 15.r,
          backgroundImage: const AssetImage(ImagePath.logo),
        ),
        isThreeLine: true,
        titleAlignment: ListTileTitleAlignment.titleHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Malik Rasaq', style: textTheme.titleSmall),
                Space.height(5),
                const RatingWidget(),
                Space.height(5),
              ],
            ),
            Text(
              '4 days ago',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        subtitle: Text(
          'wow this is the product i like the most. and a trusted and friendly shop',
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.blueGrey,
          ),
        ));
  }
}
