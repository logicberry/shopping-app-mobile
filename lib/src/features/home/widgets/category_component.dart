import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
            final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.white,
            child: SvgPicture.asset(categoryImage)),
        Space.height(5),
        Text(categoryName, style: textTheme.bodyLarge)
      ],
    );
  }
}
