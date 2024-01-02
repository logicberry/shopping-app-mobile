import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class SASearchField extends StatelessWidget {
  final String? hintText, labeltext;
  final TextEditingController? controller;
  final Widget? icon, suffix;
  final TextInputType? inputType;
  const SASearchField(
      {super.key,
      this.hintText,
      this.controller,
      this.inputType,
      required this.labeltext,
      this.icon,
      this.suffix});
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder customOutlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: AppColors.white),
      borderRadius: BorderRadius.circular(10.r),
    );
    return SizedBox(
      height: 43.h,
      width: 335.w,
      child: TextFormField(
        style: const TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            decoration: TextDecoration.none,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: AppColors.white),
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            hintText: 'Search product here',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintStyle: Theme.of(context).textTheme.labelSmall,
            suffixIcon: suffix,
            border: customOutlineInputBorder,
            enabledBorder: customOutlineInputBorder,
            focusedBorder: customOutlineInputBorder),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
