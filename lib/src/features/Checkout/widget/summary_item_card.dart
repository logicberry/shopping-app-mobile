import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../Product/widgets/palette_image.dart';

class SummaryItemCard extends StatefulWidget {
  final String productName, productPrice, productquantity, productImageUrl;
  const SummaryItemCard(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productquantity,
      required this.productImageUrl});

  @override
  State<SummaryItemCard> createState() => _SummaryItemCardState();
}

class _SummaryItemCardState extends State<SummaryItemCard> {
  Color _backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.zero,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PaletteImage(
              imageUrl: widget.productImageUrl,
              onPaletteGenerated: (color) {
                setState(() {
                  _backgroundColor = color;
                });
              }),
        ),
      ),
      title: Text(widget.productName, style: textTheme.titleMedium),
      subtitle: Text('\$${widget.productPrice}',
          style: textTheme.titleSmall?.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.w600)),
      trailing: Text(
        'Quantity ${widget.productquantity}',
        style: textTheme.labelSmall,
      ),
    );
  }
}
