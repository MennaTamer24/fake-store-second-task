import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';

class ProductsState {
  final RequestStatus status;
  final List<ProductModel> products;
  final ProductModel? selectedProduct;
  final String errMessage;

  const ProductsState({
    this.status = RequestStatus.initial,
    this.products = const [],
    this.selectedProduct,
    this.errMessage = '',
  });

  ProductsState copyWith({
    RequestStatus? status,
    List<ProductModel>? products,
    ProductModel? selectedProduct,
    String? errMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}
