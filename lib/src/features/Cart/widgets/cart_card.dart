import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Cart/controller/cart_controller.dart';

import '../../../core/core.dart';
import '../../Product/model/product_model.dart';
import '../../Product/widgets/palette_image.dart';

class CartCard extends StatefulWidget {
  final ProductModel? product;

  const CartCard({super.key, this.product});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  Color _backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
                color: _backgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PaletteImage(
                    imageUrl: widget.product?.imageUrl ?? '',
                    onPaletteGenerated: (color) {
                      setState(() {
                        _backgroundColor = color;
                      });
                    }),
              ),
            ),
            Space.width(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.product?.name ?? '',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    )),
                Text('\$${widget.product?.price}',
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
                                productId: widget.product!.id.toString()),
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
