import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/features/products/data/models/review_model.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsGridWidget extends StatelessWidget {
  const ReviewsGridWidget({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppSizes.gridPadding,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ReviewCardWidget(review: reviews[index]);
      },
    );
  }
}
