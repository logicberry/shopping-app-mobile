import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/src/core/core.dart';
import 'package:shopapp/src/features/Product/widgets/palette_image.dart';

import '../../../components/components.dart';
import '../../../services/format.dart';
import '../model/product_model.dart';
import '../widgets/widgets.dart';

Map<String, String> specifications = {
  'Processor': 'Core i3',
  'Model': 'IMAC (Mid 2010)',
  'Memory': '4GB 1333 MHz DDR3 (upgradeable)',
  'Built-In Display': '21.5 Inch (1920 x 1080)',
};

List<String> colors = [
  'Red',
  'Blue',
  'Green',
];

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Color _backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHAppBar(
        implyLeading: true,
        actionConfig: AppBarActionConfig.allActions,
        actionColor: AppColors.black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: 222.h,
                width: double.infinity,
                color: _backgroundColor,
                child: PaletteImage(
                    imageUrl: widget.product.imageUrl,
                    onPaletteGenerated: (color) {
                      setState(() {
                        _backgroundColor = color;
                      });
                    }),
              ),
              Positioned(
                bottom: -20,
                right: 20,
                child: Material(
                  elevation: 10,
                  shadowColor: AppColors.white,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(
                      SvgPath.union,
                      height: 22.h,
                      width: 24.w,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name,
                              style: AppTheme.textTheme.titleLarge
                                  ?.copyWith(color: AppColors.black)),
                          Space.height(10),
                          Row(
                            children: [
                              Image.asset(ImagePath.logo,
                                  height: 20.h, width: 20.w),
                              Space.width(10),
                              Text(widget.product.company,
                                  style: AppTheme.textTheme.labelSmall
                                      ?.copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500)),
                              const RatingWidget(),
                              Space.width(10),
                              Text('4.5',
                                  style: AppTheme.textTheme.labelSmall
                                      ?.copyWith(color: AppColors.black)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '\$${NumberFormatUtil.formatThousand(widget.product.price)}',
                              style: AppTheme.textTheme.titleLarge?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              '\$${NumberFormatUtil.formatThousand(widget.product.initialPrice)}',
                              style: AppTheme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.red,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.red,
                                  fontSize: 10.sp,
                                  letterSpacing: 0.01))
                        ],
                      ),
                    ],
                  ),
                  Space.height(20),
                  DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                              labelPadding: EdgeInsets.zero,
                              labelColor: AppColors.primaryColor,
                              labelStyle: AppTheme.textTheme.bodyLarge
                                  ?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600),
                              unselectedLabelColor: AppColors.grey,
                              indicatorColor: AppColors.primaryColor,
                              tabs: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: AppColors.grey,
                                                    width: 1))),
                                        child: const Tab(
                                          text: 'Details',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: AppColors.grey,
                                                    width: 1))),
                                        child: const Tab(
                                          text: 'Review',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                          AutoScaleTabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              // Details Tab View
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.product.description,
                                      style: AppTheme.textTheme.bodyLarge
                                          ?.copyWith(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    // Space.height(10),
                                    // Text(
                                    //   'Specifications',
                                    //   style: AppTheme.textTheme.bodyLarge
                                    //       ?.copyWith(color: Colors.blueGrey),
                                    // ),
                                    // _buildSpecificationItems(),
                                    Space.height(30),
                                    const Text('Color'),
                                    Space.height(10),
                                    SizedBox(
                                      height: 36.h,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return ColorCard(
                                              title: colors[index],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: 13.w,
                                            );
                                          },
                                          itemCount: 3),
                                    ),
                                    Space.height(94),
                                  ],
                                ),
                              ),
                              // Reviews Tab View
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return const SizedBox(
                                              child: ReviewCard());
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 5.h);
                                        },
                                      ),
                                      Space.height(94.h),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
      bottomSheet: const AddToCartBar(),
    );
  }

  Widget _buildSpecificationItems() {
    List<Widget> items = [];
    specifications.forEach((key, value) {
      items.add(_buildSpecificationItem(key, value));
      items.add(SizedBox(height: 5.h)); // Add spacing between items
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }

  Widget _buildSpecificationItem(String label, String value) {
    return Row(
      children: [
        Text(
          ' - $label',
          style: TextStyle(fontSize: 12.sp, color: Colors.blueGrey),
        ),
        Space.width(5),
        Text(
          value,
          style: TextStyle(fontSize: 12.sp, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
