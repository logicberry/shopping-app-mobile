import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/features/home/widgets/category_component.dart';
import 'package:shopapp/src/features/home/widgets/product_card.dart';
import 'package:shopapp/src/features/home/widgets/searchfield.dart';

import '../../../core/core.dart';
import '../model/productmodel.dart';
import '../widgets/promotion_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> promo = [
    ImagePath.promobanner,
    ImagePath.promo2,
  ];

  List<String> categories = [
    'Fashion',
    'Electronics',
    'F&B',
    'Beauty',
    'Deals'
  ];

  Map<String, String> categoryImages = {
    'Fashion': SvgPath.fashion,
    'Electronics': SvgPath.electronics,
    'F&B': SvgPath.fb,
    'Beauty': SvgPath.beauty,
    'Deals': SvgPath.deals,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 135.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                Space.height(20),
                Row(
                  children: [
                    Space.width(20),
                    SvgPicture.asset(SvgPath.location),
                    Space.width(10),
                    Text('St 394 Jackson, New york  United Status',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Space.height(20),
                SASearchField(
                    labeltext: '',
                    suffix: SvgPicture.asset(
                      SvgPath.search,
                      height: 14.h,
                      width: 14.w,
                      fit: BoxFit.scaleDown,
                    )),
              ],
            ),
          ),
          Space.height(19),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(children: [
              SizedBox(
                height: 69.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String categoryName = categories[index];
                    String categoryImage = categoryImages[categoryName] ?? '';

                    return CategoryComponent(
                      categoryName: categoryName,
                      categoryImage: categoryImage,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 24.w,
                  ),
                ),
              ),
            ]),
          ),
          Space.height(20),
          SizedBox(
            height: 120.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 21.w),
                itemBuilder: (context, index) {
                  return PromotionsCard(
                    promotionImage: promo[index],
                    width: 250.h,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 13.w,
                  );
                },
                itemCount: promo.length),
          ),
          Space.height(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Products',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.black)),
                GestureDetector(
                  onTap: () => context.pushNamed(RouteConstants.allProducts),
                  child: Text('See all',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ),
          Space.height(13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 160 / 190),
              itemCount: constantProducts.length,
              itemBuilder: (context, index) {
                Product product = constantProducts[index];

                return ProductCard(
                  productName: product.name,
                  company: product.company,
                  productBgColor: product.productBgColor,
                  productPrice: product.productPrice.toString(),
                  initialPrice: product.initialPrice.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
