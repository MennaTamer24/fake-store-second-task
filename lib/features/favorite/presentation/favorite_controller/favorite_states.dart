import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';

class FavoriteState {
  final List<ProductModel> favoriteProducts;
  final String errMessage;
  final RequestStatus status;

  FavoriteState({
    this.favoriteProducts = const [],
    this.errMessage = '',
    this.status = RequestStatus.initial,
  });
  FavoriteState copyWith({
    List<ProductModel>? favoriteProducts,
    String? errMessage,
    RequestStatus? status,
  }) {
    return FavoriteState(
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      errMessage: errMessage ?? this.errMessage,
      status: status ?? this.status,
    );
  }
}
