import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/features/Product/controller/product_controller.dart';
import 'package:shopapp/src/features/Product/model/product_model.dart';
import 'package:shopapp/src/services/locator_service.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../widgets/widgets.dart';

class ProductPage extends StatefulWidget {
  final String? categoryId;

  const ProductPage({super.key, this.categoryId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<ProductModel>> _futureProducts;
  final ProductProvider productProvider = locator<ProductProvider>();

  @override
  void initState() {
    super.initState();
    _futureProducts = _fetchProducts();
  }

  Future<List<ProductModel>> _fetchProducts() async {
    if (widget.categoryId != '') {
      // Fetch products based on category ID if provided
      return productProvider.getProductByCategory(
          categoryId: widget.categoryId!, context: context);
    } else {
      // Fetch all products if no category ID provided
      return productProvider.getAllProducts(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: SHAppBar(
        implyLeading: true,
        background: AppColors.primaryColor,
        title: widget.categoryId != '' ? 'Category Products' : 'All Products',
        actionColor: AppColors.white,
        actionConfig: AppBarActionConfig.allActions,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0.h),
        child: FutureBuilder<List<ProductModel>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 13.0,
                  childAspectRatio: 160 / 199,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ProductModel product = snapshot.data![index];

                  return ProductCard(
                    onTap: () {
                      context.pushNamed(RouteConstants.productDetails,
                          extra: product);
                    },
                    productName: product.name,
                    company: product.company,
                    image: product.imageUrl,
                    productPrice: product.price,
                    initialPrice: product.initialPrice,
                  );
                },
              );
            } else {
              return const Center(child: Text('No products available'));
            }
          },
        ),
      ),
    );
  }
}
