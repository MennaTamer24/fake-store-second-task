import 'package:fake_store_second_task/core/utils/app_colors.dart';
import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/favorite_button_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_image_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavorite,
    required this.isFavorite,
  });

  final ProductModel product;

  final VoidCallback onTap;

  final VoidCallback onFavorite;

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        height: 251.h,
        width: 171.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  ProductImageWidget(image: product.thumbnail),
                  FavoriteButtonWidget(
                    isFavorite: isFavorite,
                    onTap: onFavorite,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.category, style: AppTextStyles.category),
                    Gap(4.h),
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.productName,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text("\$${product.price}", style: AppTextStyles.price),
                        const Spacer(),
                        ProductRatingWidget(rating: product.rating),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
