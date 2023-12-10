import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/core.dart';

class SATextField extends StatefulWidget {
  final String? hintText, labeltext;
  final TextEditingController? controller;
  final Widget? icon, prefix;
  final TextInputType? inputType;
  final bool isPassword;

  const SATextField(
      {super.key,
      this.hintText,
      this.controller,
      this.inputType,
      this.labeltext,
      this.icon,
      this.isPassword = false,
      this.prefix});

  @override
  State<SATextField> createState() => _SATextFieldState();
}

class _SATextFieldState extends State<SATextField> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    _obscureText = false;
    super.initState();
  }

  void pass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    const UnderlineInputBorder defaultOutlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.grey),
    );

    const UnderlineInputBorder focusedOutlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.grey),
    );
    return SizedBox(
      height: 57.h,
      child: TextFormField(
        obscureText: (widget.isPassword) ? !_obscureText : _obscureText,
        style: TextStyle(
            fontSize: 13.sp,
            letterSpacing: 1,
            decoration: TextDecoration.none,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: AppColors.white),
        controller: widget.controller,
        keyboardType: widget.inputType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        cursorWidth: 1.5,
        decoration: InputDecoration(
            labelText: widget.hintText,
            hintText: widget.hintText,
            isDense: true,
            floatingLabelStyle:
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      height: 0.3,
                      color: Colors.grey,
                    ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
            prefixIcon: widget.prefix,
            suffix: (widget.isPassword)
                ? GestureDetector(
                    onTap: pass,
                    child: Text(
                      _obscureText ? 'Hide' : 'Show',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.black),
                    ),
                  )
                : null,
            border: defaultOutlineInputBorder,
            enabledBorder: defaultOutlineInputBorder,
            focusedBorder: focusedOutlineInputBorder),
        cursorColor: AppColors.black,
      ),
    );
  }
}
