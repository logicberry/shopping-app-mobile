import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Cart/model/cart_model.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../controller/cart_controller.dart';
import '../controller/selected_item_controller.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _toggleItemSelection(CartModel item, SelectedItemsProvider provider) {
    provider.toggleItemSelection(item);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cartItems;
    final selectedItemsProvider = context.watch<SelectedItemsProvider>();

    // Calculate total Price
    // double totalPrice = 0.0;
    // for (final cartItem in cart) {
    //   totalPrice += cartItem.product!.price * cartItem.quantity!;
    // }

    double totalPrice = 0.0;
    for (final cartItem in cart) {
      if (selectedItemsProvider.isItemSelected(cartItem)) {
        totalPrice += cartItem.product!.price * cartItem.quantity!;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SHAppBar(
          implyLeading: true,
          actionColor: AppColors.white,
          background: AppColors.primaryColor,
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
                          title: Text('Select All Item',
                              style: Theme.of(context).textTheme.bodyMedium),
                          value: selectedItemsProvider.selectedItems.length ==
                              cart.length,
                          onChanged: (bool? value) {
                            if (value ?? false) {
                              for (var item in cart) {
                                _toggleItemSelection(
                                    item, selectedItemsProvider);
                              }
                            } else {
                              selectedItemsProvider.clearSelection();
                            }
                          },
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                child: CartCard(
                              product: cart[index].product,
                              isSelected: selectedItemsProvider
                                  .isItemSelected(cart[index]),
                              onSelected: (value) {
                                _toggleItemSelection(
                                    cart[index], selectedItemsProvider);
                              },
                            ));
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
              title: 'Buy (${selectedItemsProvider.selectedItems.length})',
              totalPrice: totalPrice.toString(),
              onTap: () => context.pushNamed(RouteConstants.checkOut, extra: {
                "a": selectedItemsProvider.selectedItems,
                "b": totalPrice
              }),
            )
          : null,
    );
  }
}
