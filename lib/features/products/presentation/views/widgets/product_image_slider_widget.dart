import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store_second_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSliderWidget extends StatefulWidget {
  const ProductImageSliderWidget({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductImageSliderWidget> createState() =>
      _ProductImageSliderWidgetState();
}

class _ProductImageSliderWidgetState extends State<ProductImageSliderWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasMultipleImages = widget.images.length > 1;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index, realint) {
            return CachedNetworkImage(
              imageUrl: widget.images[index],
              fit: BoxFit.contain,
            );
          },
          options: CarouselOptions(
            height: 305.h,
            viewportFraction: 1,
            enlargeCenterPage: false,

            scrollPhysics: hasMultipleImages
                ? null
                : const NeverScrollableScrollPhysics(),
            enableInfiniteScroll: hasMultipleImages,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),

        if (hasMultipleImages) ...[
          Gap(8.h),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.images.length,
            effect: ExpandingDotsEffect(
              dotWidth: 8.w,
              dotHeight: 8.h,
              expansionFactor: 2.5,
              spacing: 6.w,
              activeDotColor: AppColors.primary,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ],
      ],
    );
  }
}
