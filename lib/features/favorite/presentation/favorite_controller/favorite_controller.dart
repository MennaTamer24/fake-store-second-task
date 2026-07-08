import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_second_task/features/favorite/data/favorite_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    emit(state.copyWith(status: RequestStatus.loading));

    final result = await favoriteRepository.getFavoriteProducts();

    result.fold(
      (failure) => emit(
        state.copyWith(
          errMessage: failure.errMessage,
          status: RequestStatus.failure,
        ),
      ),
      (products) => emit(
        state.copyWith(
          favoriteProducts: products,
          status: RequestStatus.success,
        ),
      ),
    );
  }

  Future<void> toggleFavorite(int productId) async {
    await favoriteRepository.toggleFavorite(productId);

    await loadFavorites();
  }

  bool isFavorite(int productId) {
    return favoriteRepository.isFavorite(productId);
  }
}
