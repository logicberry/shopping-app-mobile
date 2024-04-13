import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Profile/controller/user_controller.dart';
import 'package:shopapp/src/features/home/widgets/category_component.dart';
import 'package:shopapp/src/features/home/widgets/product_card.dart';
import 'package:shopapp/src/features/home/widgets/searchfield.dart';
import 'package:shopapp/src/services/locator_service.dart';

import '../../../core/core.dart';
import '../../Product/controller/product_controller.dart';
import '../../Product/model/product_model.dart';
import '../widgets/promotion_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> promo = [
    ImagePath.promo1,
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

  final ProductProvider productProvider = locator<ProductProvider>();
  List<ProductModel> products = [];
  getProducts() async {
    products = await productProvider.getAllProducts(context: context);
    setState(() {});
  }

  getUser() async {
    await context.read<UserProvider>().viewProfile(context: context);
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.watch<UserProvider>().user;
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
                    GestureDetector(
                      onTap: () =>
                          user.address != null && user.address!.isNotEmpty
                              ? null
                              : context.pushNamed(RouteConstants.editProfile,
                                  extra: user),
                      child: Text(
                          user.address != null && user.address!.isNotEmpty
                              ? '${user.address}, ${user.country}'
                              : 'Tap to set your address',
                          style: textTheme.bodyLarge?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400)),
                    ),
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
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Row(
              children: List.generate(
                categories.length,
                (index) {
                  String categoryName = categories[index];
                  String categoryImage = categoryImages[categoryName] ?? '';
                  String idx = '${index + 1}';

                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(RouteConstants.allProducts,
                            queryParameters: {
                              'categoryId': idx,
                            });
                      },
                      child: CategoryComponent(
                        categoryName: categoryName,
                        categoryImage: categoryImage,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
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
                Text('New Products', style: textTheme.bodyMedium),
                GestureDetector(
                  onTap: () => context.pushNamed(RouteConstants.allProducts, queryParameters: {'categoryId': ''}),
                  child: Text('See all',
                      style: textTheme.labelLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ),
          Space.height(13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: products.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13.0,
                            mainAxisSpacing: 1.0,
                            childAspectRatio: 160 / 190),
                    itemCount: (products.length < 4) ? products.length : 4,
                    itemBuilder: (context, index) {
                      ProductModel product = products[index];

                      return ProductCard(
                        productName: product.name,
                        company: product.company,
                        image: product.imageUrl,
                        productPrice: product.price,
                        initialPrice: product.initialPrice,
                      );
                    },
                  )
                : SizedBox(
                    height: 200.h,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )),
                  ),
          ),
        ],
      ),
    );
  }
}
