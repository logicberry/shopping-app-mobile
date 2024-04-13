import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../Product/model/product_model.dart';
import '../../Product/widgets/palette_image.dart';

// Map<String, String> specifications = {
//   'Processor': 'Core i3',
//   'Model': 'IMAC (Mid 2010)',
//   'Memory': '4GB 1333 MHz DDR3 (upgradeable)',
//   'Built-In Display': '21.5 Inch (1920 x 1080)',
// };

class FeedCard extends StatefulWidget {
  final ProductModel product;
  const FeedCard({super.key, required this.product});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => context.pushNamed(RouteConstants.productDetails,
          extra: widget.product),
      child: Container(
        height: 420.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                visualDensity:
                    const VisualDensity(horizontal: 0, vertical: -3.5),
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: -20,
                horizontalTitleGap: 11,
                leading: SizedBox(
                  height: double.infinity,
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundImage: const AssetImage(ImagePath.logo),
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.titleHeight,
                title: Text(widget.product.name,
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                subtitle:
                    Text(widget.product.company, style: textTheme.labelSmall),
                trailing: const Icon(Icons.more_horiz_outlined),
              ),
            ),
            Container(
              height: 170.h,
              width: double.infinity,
              decoration: BoxDecoration(color: _backgroundColor),
              child: PaletteImage(
                  imageUrl: widget.product.imageUrl,
                  onPaletteGenerated: (color) {
                    setState(() {
                      _backgroundColor = color;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('12 mins', style: textTheme.labelSmall),
                      const Spacer(),
                      SvgPicture.asset(SvgPath.chat),
                      Space.width(27),
                      SvgPicture.asset(SvgPath.like),
                      Space.width(27),
                      SvgPicture.asset(SvgPath.share),
                    ],
                  ),
                  Space.height(8),
                  Text(widget.product.description.toUpperCase(),
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400)),
                  Space.height(4),
                  // _buildSpecificationItems(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   Widget _buildSpecificationItems() {
//     List<Widget> items = [];
//     specifications.forEach((key, value) {
//       items.add(_buildSpecificationItem(key, value));
//       items.add(SizedBox(height: 1.h));
//     });
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: items,
//     );
//   }

//   Widget _buildSpecificationItem(String label, String value) {
//     return Row(
//       children: [
//         Text(
//           ' - $label',
//           style: TextStyle(
//             fontSize: 12.sp,
//           ),
//         ),
//         Space.width(5),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 12.sp,
//           ),
//         ),
//       ],
//     );
//   }
// }
