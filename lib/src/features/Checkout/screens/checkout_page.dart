import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/core.dart';

import '../../../components/components.dart';
import '../widget/widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
          actionConfig: AppBarActionConfig.messageAndNotification,
          title: 'Checkout',
          centerTitle: true,
          implyLeading: true,
          actionColor: Colors.black),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shipping Address'),
                Space.height(6),
                Container(
                  height: 90.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Domen Tikoro Street:  825 Baker Avenue, Dallas,Texas, Zip code  75202',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.black,
                                  )),
                      Text('Change address',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 10.sp)),
                    ],
                  ),
                ),
                Space.height(20),
                const Text('Summary Item'),
                Space.height(6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          3,
                          (index) {
                            return Column(
                              children: [
                                const SummaryItemCard(),
                                if (index < 3 - 1) const Divider(),
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
                      fillColor: AppColors.white,
                      filled: true,
                      hintText: 'Enter Coupon Code',
                      hintStyle: Theme.of(context).textTheme.labelSmall,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
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
                const Text('Summary Order'),
                Space.height(6),
                Container(
                  height: 120.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Delivery Fee',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
                          const Spacer(),
                          Text('\$ 10.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Subtotal',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
                          const Spacer(),
                          Text('\$ 150.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Tax',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
                          const Spacer(),
                          Text('\$ 160.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                  )),
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
      bottomSheet: CartAndCheckoutBar(onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const SuccessPopUp();
            });
      }),
    );
  }
}
