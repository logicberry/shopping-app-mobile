import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Cart/controller/cart_controller.dart';

import '../../../core/core.dart';
import '../../Product/model/product_model.dart';

class CartCard extends StatelessWidget {
  final ProductModel? product;

  const CartCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: AppColors.primaryColor,
              value: true,
              onChanged: (v) {},
              shape: const CircleBorder(),
            ),
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage(ImagePath.welcome),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Space.width(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(product?.name ?? '',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    )),
                Text('\$${product?.price}',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    )),
                Space.height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const CartAddRemove(),
                    Space.width(60),
                    GestureDetector(
                        onTap: () => context
                            .read<CartProvider>()
                            .removeFromCart(
                                context: context,
                                productId: product!.id.toString()),
                        child: SvgPicture.asset(SvgPath.delete)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
