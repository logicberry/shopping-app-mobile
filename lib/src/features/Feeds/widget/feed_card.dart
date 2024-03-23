import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

Map<String, String> specifications = {
  'Processor': 'Core i3',
  'Model': 'IMAC (Mid 2010)',
  'Memory': '4GB 1333 MHz DDR3 (upgradeable)',
  'Built-In Display': '21.5 Inch (1920 x 1080)',
};

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          color: AppColors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -3.5),
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
              title: Text('Malik Rasaq',
                  style: Theme.of(context).textTheme.titleSmall),
              subtitle: Text(
                'Applestore',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.blueGrey,
                    ),
              ),
              trailing: const Icon(Icons.more_horiz_outlined),
            ),
          ),
          Container(
            height: 170.h,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.pink),
            child: Image.asset(ImagePath.logo),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('12 mins'),
                    const Spacer(),
                    SvgPicture.asset(SvgPath.promo),
                    Space.width(10),
                    SvgPicture.asset(SvgPath.promo),
                    Space.width(10),
                    SvgPicture.asset(SvgPath.categories),
                  ],
                ),
                Space.height(8),
                Text(
                  'IMAC SILVER 21,5 INCH MID 2010/2011 RAM 8GB HDD 500GB SECOND',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
                Space.height(4),
                _buildSpecificationItems(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSpecificationItems() {
    List<Widget> items = [];
    specifications.forEach((key, value) {
      items.add(_buildSpecificationItem(key, value));
      items.add(SizedBox(height: 1.h)); // Add spacing between items
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
