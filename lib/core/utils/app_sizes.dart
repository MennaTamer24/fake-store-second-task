import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  static final screenPadding = EdgeInsets.symmetric(horizontal: 16.w);

  static final gridPadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );

  static final reviewPadding = EdgeInsets.all(12.r);

  static final reviewBorderRadius = BorderRadius.circular(12.r);

  static final productImageRadius = BorderRadius.vertical(
    top: Radius.circular(16.r),
  );
}
