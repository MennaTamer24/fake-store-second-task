import 'package:fake_store_second_task/core/utils/app_colors.dart';
import 'package:fake_store_second_task/core/utils/app_strings.dart';
import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.category,
            style: TextStyle(color: const Color(0xff8361D9), fontSize: 14.sp),
          ),

          SizedBox(height: 8.h),

          Row(
            children: [
              Text(
                product.title,
                style: AppTextStyles.productName.copyWith(fontSize: 18.sp),
              ),
              Spacer(),
              Text(
                "\$${product.price}",
                style: AppTextStyles.price.copyWith(fontSize: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 30.h),

          Text(
            product.description,
            style: AppTextStyles.description.copyWith(
              fontSize: 13.sp,
              height: 1.5,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              Text(
                AppStrings.reviews,
                style: AppTextStyles.productName.copyWith(fontSize: 18.sp),
              ),
              Spacer(),
              const Icon(Icons.star, color: Color(0xffFCD53F)),

              SizedBox(width: 4.w),

              Text(
                product.rating.toStringAsFixed(1),
                style: AppTextStyles.rating.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
