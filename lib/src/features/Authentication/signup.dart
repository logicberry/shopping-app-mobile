import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/asset-manager/app_assets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: 380.h,
            width: double.infinity,
            color: Colors.green,
            child: Image.asset(
              ImagePath.welcome,
              fit: BoxFit.cover,
            )),
      ],
    ));
  }
}
