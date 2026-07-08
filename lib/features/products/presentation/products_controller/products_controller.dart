import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/products/data/repo/products_repo.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository productRepository;

  ProductsCubit({required this.productRepository})
    : super(const ProductsState()) {
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await productRepository.getAllProducts();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            errMessage: failure.errMessage,
          ),
        );
      },
      (products) {
        emit(state.copyWith(status: RequestStatus.success, products: products));
      },
    );
  }

  Future<void> getProductById(int id) async {
    final result = await productRepository.getProductById(id);

    result.fold(
      (failure) {
        emit(state.copyWith(errMessage: failure.errMessage));
      },
      (product) {
        emit(state.copyWith(selectedProduct: product));
      },
    );
  }
}
