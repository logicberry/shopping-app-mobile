import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cartItems;

    // Calculate total Price
    double totalPrice = 0.0;
    for (final cartItem in cart) {
      totalPrice += cartItem.product!.price * cartItem.quantity!;
    }

    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
          implyLeading: true,
          actionColor: AppColors.black,
          title: 'Your Cart',
          centerTitle: true,
          actionConfig: AppBarActionConfig.messageAndNotification),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: cart.isNotEmpty
                  ? Column(
                      children: [
                        CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            activeColor: AppColors.primaryColor,
                            checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text('Select All Item'),
                            value: true,
                            onChanged: (v) {}),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                child: CartCard(product: cart[index].product));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                        ),
                        Space.height(94.h),
                      ],
                    )
                  : const Center(
                      child: Text('No Item in cart'),
                    ))),
      bottomSheet: cart.isNotEmpty
          ? CartAndCheckoutBar(
              totalPrice: totalPrice.toString(),
              onTap: () => context.pushNamed(RouteConstants.checkOut,
                  extra: {"a": cart, "b": totalPrice}),
            )
          : null,
    );
  }
}
