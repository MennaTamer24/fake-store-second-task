import 'package:fake_store_second_task/core/extentions/context_extension.dart';
import 'package:fake_store_second_task/core/utils/app_assets.dart';
import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/core/utils/app_strings.dart';
import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_controller.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_states.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class DetailsAppBarWidget extends StatelessWidget {
  const DetailsAppBarWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.gridPadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: SvgPicture.asset(Assets.back, width: 32.w, height: 32.h),
          ),

          const Spacer(),

          Text(AppStrings.productDetails, style: AppTextStyles.title),

          const Spacer(),

          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              final favoriteCubit = context.read<FavoriteCubit>();

              final isFavorite = favoriteCubit.isFavorite(product.id);

              return GestureDetector(
                onTap: () {
                  favoriteCubit.toggleFavorite(product.id);
                },
                child: SvgPicture.asset(
                  isFavorite ? Assets.heartFilled : Assets.heart,
                  width: 32.w,
                  height: 32.h,
                ),
              );
            },
          ),

          SizedBox(width: 16.w),

          GestureDetector(
            onTap: () {
              SharePlus.instance.share(
                ShareParams(text: '${product.title}\n${product.description}'),
              );
            },
            child: SvgPicture.asset(Assets.share, width: 22.w),
          ),
        ],
      ),
    );
  }
}
