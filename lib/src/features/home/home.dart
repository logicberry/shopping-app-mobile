import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/src/components/appbar.dart';
import 'package:shopapp/src/features/home/widgets/category_component.dart';
import 'package:shopapp/src/features/home/widgets/product_card.dart';
import 'package:shopapp/src/features/home/widgets/searchfield.dart';

import '../../components/sidenav.dart';
import '../../core/core.dart';
import 'model/productmodel.dart';
import 'widgets/promotion_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> categories = [
    'Fashion',
    'Electronics',
    'F&B',
    'Beauty',
    'Deals'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideMenu(),
        backgroundColor: AppColors.ash,
        appBar: SHAppBar(
          title: 'Home',
          ontap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          actionConfig: AppBarActionConfig.allActions,
          background: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 69.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          String categoryName = categories[index];
                          String categoryImage = ImagePath.logo;

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
                    Space.height(20),
                    SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return PromotionsCard(
                              promotionImage:
                                  'https://t4.ftcdn.net/jpg/02/62/03/53/360_F_262035364_gGi8uJsPl9uljis8C6oxI0w6AM7MKDLq.webp',
                              width: 250.h,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 13.w,
                            );
                          },
                          itemCount: 3),
                    ),
                    Space.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Products',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.black)),
                        Text('See all',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w400))
                      ],
                    ),
                    Space.height(13),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 13.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 160 / 199),
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
