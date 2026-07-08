import 'package:fake_store_second_task/core/utils/app_strings.dart';
import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_controller.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_state.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/details_appbar_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_image_slider_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/product_info_widget.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/reviews_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == RequestStatus.failure) {
          return Scaffold(body: Center(child: Text(state.errMessage)));
        }

        final product = state.selectedProduct;

        if (product == null) {
          return const Scaffold(
            body: Center(child: Text(AppStrings.noProductsFound)),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DetailsAppBarWidget(product: product),

                  SizedBox(height: 12.h),

                  ProductImageSliderWidget(images: product.images),

                  SizedBox(height: 20.h),

                  ProductInfoWidget(product: product),

                  SizedBox(height: 28.h),

                  ReviewsGridWidget(reviews: product.reviews),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
