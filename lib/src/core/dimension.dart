import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space {
  static SizedBox height(double height) {
    return SizedBox(height: height.h);
  }

  static SizedBox width(double width) {
    return SizedBox(width: width.w);
  }
}
