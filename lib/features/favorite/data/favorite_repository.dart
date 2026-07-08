import 'package:dartz/dartz.dart';
import 'package:fake_store_second_task/core/errors/failures.dart';
import 'package:fake_store_second_task/features/favorite/data/favorite_data_source.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';
import 'package:fake_store_second_task/features/products/data/repo/products_repo.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(int productId);
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts();
  bool isFavorite(int productId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final ProductRepository productRepository;
  final FavoriteDataSource favoriteDataSource;

  FavoriteRepositoryImpl({
    required this.favoriteDataSource,
    required this.productRepository,
  });

  @override
  Future<void> toggleFavorite(int productId) async {
    await favoriteDataSource.toggleFavorite(productId);
  }

  @override
  bool isFavorite(int productId) {
    return favoriteDataSource.isFavorite(productId);
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() async {
    final ids = favoriteDataSource.getFavoriteProductIds();

    final result = await productRepository.getAllProducts();

    return result.fold((failure) => Left(failure), (cachedProducts) {
      final favorites = cachedProducts
          .where((product) => ids.contains(product.id))
          .toList();

      return Right(favorites);
    });
  }
}
