import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.star, width: 14.w, height: 14.h),

        SizedBox(width: 4.w),

        Text(rating.toStringAsFixed(1), style: AppTextStyles.rating),
      ],
    );
  }
}
