import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/locator_service.dart';
import '../../Product/controller/product_controller.dart';
import '../../Product/model/product_model.dart';
import '../widget/feed_card.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final ProductProvider productProvider = locator<ProductProvider>();
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return  FeedCard(product: products[index],);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
        ),
      ),
    );
  }
}
