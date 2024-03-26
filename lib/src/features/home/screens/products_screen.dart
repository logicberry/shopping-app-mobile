import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../model/productmodel.dart';
import '../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.ash,
        appBar: const SHAppBar(
          background: AppColors.primaryColor,
          title: 'All Products',
          actionConfig: AppBarActionConfig.allActions,
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0.h),
          child: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 13.0,
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
          ),
        ));
  }
}
