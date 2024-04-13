import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/core/core.dart';
import 'package:shopapp/src/features/Profile/controller/user_controller.dart';

import '../../../components/components.dart';
import '../../Cart/model/cart_model.dart';
import '../widget/widget.dart';

class CheckOutPage extends StatefulWidget {
  final List<CartModel> products;
  final double totalPrice;
  const CheckOutPage(
      {super.key, required this.products, required this.totalPrice});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  double deliveryFee = 10.00;
  double tax = 5.00;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final user = context.read<UserProvider>().user;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.messageAndNotification,
        title: 'Checkout',
        centerTitle: true,
        implyLeading: true,
        actionColor: AppColors.white,
        background: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shipping Address', style: textTheme.bodyMedium),
                Space.height(6),
                Container(
                  height: 90.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.address ?? 'No address found',
                          style: textTheme.bodyLarge),
                      GestureDetector(
                        onTap: () => context
                            .pushNamed(RouteConstants.editProfile, extra: user),
                        child: Text(
                            user.address != null
                                ? 'Change address'
                                : 'Add address',
                            style: textTheme.labelSmall?.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 10.sp)),
                      ),
                    ],
                  ),
                ),
                Space.height(20),
                Text('Summary Item', style: textTheme.bodyMedium),
                Space.height(6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          widget.products.length,
                          (index) {
                            final item = widget.products[index];
                            return Column(
                              children: [
                                SummaryItemCard(
                                  productName: item.product!.name,
                                  productPrice: item.product!.price.toString(),
                                  productquantity: item.quantity.toString(),
                                  productImageUrl: item.product!.imageUrl,
                                ),
                                // if (index < 3 - 1) const Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Space.height(20),
                SizedBox(
                  height: 70.h,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: theme.cardColor,
                      filled: true,
                      hintText: 'Enter Coupon Code',
                      hintStyle: textTheme.labelSmall,
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0.h, horizontal: 15.0.w),
                        child: Container(
                          width: 102.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.5,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: Center(
                            child: Text('USE COUPON',
                                style: textTheme.labelSmall?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp)),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.white)),
                    ),
                  ),
                ),
                Space.height(20),
                Text('Summary Order', style: textTheme.bodyMedium),
                Space.height(6),
                Container(
                  height: 120.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Delivery Fee', style: textTheme.bodySmall),
                          const Spacer(),
                          Text('\$ $deliveryFee', style: textTheme.bodySmall),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Subtotal', style: textTheme.bodySmall),
                          const Spacer(),
                          Text('\$ ${widget.totalPrice}',
                              style: textTheme.bodySmall),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Tax', style: textTheme.bodySmall),
                          const Spacer(),
                          Text('\$ $tax', style: textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                Space.height(96)
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CartAndCheckoutBar(
          totalPrice: '${widget.totalPrice + deliveryFee + tax}',
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const SuccessPopUp();
                });
          }),
    );
  }
}
