import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle productName = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle category = TextStyle(fontSize: 12.sp, color: AppColors.grey);

  static TextStyle price = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle rating = TextStyle(fontSize: 12.sp, color: AppColors.grey);

  static TextStyle description = TextStyle(
    fontSize: 14.sp,
    color: AppColors.grey,
    height: 1.6,
  );
}
