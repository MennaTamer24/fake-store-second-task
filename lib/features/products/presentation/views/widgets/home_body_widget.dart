import 'package:fake_store_second_task/core/extentions/context_extension.dart';
import 'package:fake_store_second_task/core/extentions/widget_extension.dart';
import 'package:fake_store_second_task/core/utils/app_routes.dart';
import 'package:fake_store_second_task/core/utils/app_sizes.dart';
import 'package:fake_store_second_task/core/utils/app_strings.dart';
import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_controller.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_states.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_controller.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_state.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_card_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_grid_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return const ProductGridShimmerWidget().center();
        }

        if (state.status == RequestStatus.failure) {
          return Text(state.errMessage).center();
        }

        final products = state.products;

        if (products.isEmpty) {
          return const Text(AppStrings.noProducts).center();
        }

        return GridView.builder(
          padding: AppSizes.gridPadding,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: .68,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, favoriteState) {
                final favoriteCubit = context.read<FavoriteCubit>();

                return ProductCardWidget(
                  product: product,
                  isFavorite: favoriteCubit.isFavorite(product.id),
                  onFavorite: () {
                    favoriteCubit.toggleFavorite(product.id);
                  },
                  onTap: () async {
                    await context.read<ProductsCubit>().getProductById(
                      product.id,
                    );

                    if (context.mounted) {
                      context.pushNamed(AppRoutes.details);
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
