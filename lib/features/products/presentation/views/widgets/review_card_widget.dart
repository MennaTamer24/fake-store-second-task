import 'package:fake_store_second_task/core/utils/app_colors.dart';
import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/core/utils/app_assets.dart';
import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/features/products/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.reviewPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSizes.reviewBorderRadius,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.person, width: 30.w, height: 30.h),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  review.reviewerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.description.copyWith(
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 3.h),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),

              SizedBox(width: 4.w),

              Text(
                review.rating.toString(),
                style: TextStyle(fontSize: 13.sp, color: AppColors.primary),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Text(
            review.comment,
            style: AppTextStyles.description.copyWith(
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
