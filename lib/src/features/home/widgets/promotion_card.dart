import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionsCard extends StatelessWidget {
  final String promotionImage;
  final double? height, width;
  const PromotionsCard(
      {super.key, required this.promotionImage, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 141.h,
      width: width ?? 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(promotionImage),
        ),
      ),
    );
  }
}
