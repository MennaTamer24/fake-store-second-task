import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_card_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridShimmerWidget extends StatelessWidget {
  const ProductGridShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppSizes.gridPadding,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, _) => const ProductCardShimmerWidget(),
    );
  }
}
