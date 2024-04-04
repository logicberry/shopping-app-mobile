import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/features/Product/controller/product_controller.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../Product/repository/product_repository.dart';
import '../widgets/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductProvider productProvider = ProductProvider(ProductRepository());
  List<ProductModel> products = [];
  getProducts() async {
    products = await productProvider.getAllProducts(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.ash,
        appBar: const SHAppBar(
          implyLeading: true,
          background: AppColors.primaryColor,
          title: 'All Products',
          actionColor: AppColors.white,
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
              itemCount: products.length,
              itemBuilder: (context, index) {
                ProductModel product = products[index];

                return ProductCard(
                  productName: product.name,
                  company: product.company,
                  image: product.imageUrl,
                  productBgColor: Colors.lightGreenAccent,
                  productPrice: product.price,
                  initialPrice: product.initialPrice,
                );
              },
            ),
          ),
        ));
  }
}
