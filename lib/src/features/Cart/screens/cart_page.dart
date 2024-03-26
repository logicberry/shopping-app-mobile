import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/features/Product/widgets/addtocart.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
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
              itemCount: 4,
              itemBuilder: (context, index) {
                return const SizedBox(child: CartCard());
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
            ),
            Space.height(94.h),
          ],
        ),
      )),
      bottomSheet: const AddToCartBar(),
    );
  }
}
