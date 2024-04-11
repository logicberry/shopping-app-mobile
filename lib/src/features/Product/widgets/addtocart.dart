import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class AddToCartBar extends StatefulWidget {
  final VoidCallback? onTap;
  final void Function(int) onQuantityChanged;
  const AddToCartBar({super.key, this.onTap, required this.onQuantityChanged});

  @override
  State<AddToCartBar> createState() => _AddToCartBarState();
}

class _AddToCartBarState extends State<AddToCartBar> {
  int quantity = 1;
  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onQuantityChanged(quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 94.h,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: decreaseQuantity,
                  child: SizedBox(
                    height: 27.h,
                    width: 27.w,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.zero,
                      child: const Icon(
                        Icons.remove,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                Space.width(13),
                Text(quantity.toString(), style: textTheme.bodyMedium),
                Space.width(13),
                GestureDetector(
                  onTap: increaseQuantity,
                  child: SizedBox(
                    height: 27.h,
                    width: 27.w,
                    child: Card(
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.zero,
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Space.width(30),
            SizedBox(
                width: 185.w,
                child:
                    SAActionButton(title: 'Add to Cart', onTap: widget.onTap)),
          ],
        ),
      ),
    );
  }
}
