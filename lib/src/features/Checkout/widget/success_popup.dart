import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/components/button.dart';
import 'package:shopapp/src/core/core.dart';

import '../../Cart/controller/cart_controller.dart';

class SuccessPopUp extends StatelessWidget {
  const SuccessPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: SizedBox(
          height: 430.h,
          width: 335.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  child: Image.asset(ImagePath.welcome, fit: BoxFit.contain),
                ),
                Space.height(40),
                const Text('Your order has been successful'),
                Space.height(20),
                Text(
                    'we will contact the seller so that it can be sent immediately to the destination',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall),
                Space.height(40),
                SAActionButton(
                  title: 'OK',
                  onTap: () => context.read<CartProvider>().clearCart(),
                )
              ],
            ),
          ),
        ));
  }
}
