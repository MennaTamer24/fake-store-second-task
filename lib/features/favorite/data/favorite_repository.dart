import 'package:dartz/dartz.dart';
import 'package:fake_store_second_task/core/errors/failures.dart';
import 'package:fake_store_second_task/core/services/cache/cache_services.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';
import 'package:fake_store_second_task/features/products/data/repo/products_repo.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(int productId, bool value);
  Future<bool> isFavorite(int productId);
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts();
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final CacheServices cacheServices;
  final ProductRepository productRepository;

  FavoriteRepositoryImpl({
    required this.cacheServices,
    required this.productRepository,
  });

  @override
  Future<void> toggleFavorite(int productId, bool value) async {
    try {
      await cacheServices.put(
        boxName: 'favorites',
        key: productId,
        value: value,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return await cacheServices.get<bool>(
      boxName: 'favorites',
      key: productId,
      defaultValue: false,
    );
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() async {
    try {
      final favoriteMap = (await cacheServices.getBox('favorites')).toMap();

      final result = await productRepository.getAllProducts();

      return result.fold((failure) => Left(failure), (products) {
        final favoriteProducts = products.where((product) {
          return favoriteMap[product.id] == true;
        }).toList();

        return Right(favoriteProducts);
      });
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
