import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_card_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppSizes.productImageRadius,
      child: CachedNetworkImage(
        imageUrl: image,
        width: double.infinity,
        fit: BoxFit.cover,

        placeholder: (context, url) =>
            const Center(child: ProductCardShimmerWidget()),

        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
