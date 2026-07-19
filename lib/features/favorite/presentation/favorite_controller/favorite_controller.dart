import 'package:fake_store_second_task/core/utils/request_states.dart';
import 'package:fake_store_second_task/features/favorite/data/favorite_repository.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await favoriteRepository.getFavoriteProducts();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errMessage: failure.errMessage,
            status: RequestStatus.failure,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            favoriteProducts: products,
            status: RequestStatus.success,
          ),
        );
      },
    );
  }

  Future<void> toggleFavorite(int productId) async {
    final isFav = await favoriteRepository.isFavorite(productId);
    try {
      await favoriteRepository.toggleFavorite(productId, !isFav);
      await loadFavorites();
    } catch (e) {
      emit(
        state.copyWith(errMessage: e.toString(), status: RequestStatus.failure),
      );
    }
  }

  bool isFavorite(int productId) {
    return state.favoriteProducts.any((product) => product.id == productId);
  }
}
