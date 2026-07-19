import 'package:dartz/dartz.dart';
import 'package:fake_store_second_task/core/errors/failures.dart';
import 'package:fake_store_second_task/core/services/cache/cache_services.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';

abstract class LocaleDataSource {
  Future<Either<Failure, List<ProductModel>>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class LocaleDataSourceImpl implements LocaleDataSource {
  final CacheServices storage;

  LocaleDataSourceImpl(this.storage);

  @override
  Future<Either<Failure, List<ProductModel>>> getCachedProducts() async {
    final box = await storage.getBox('products');

    final data = List<Map<String, dynamic>>.from(
      box.get(
        'products', //, defaultValue: []
      ),
    );

    if (data.isEmpty) {
      return Left(CacheFailure('No cached products found'));
    }

    final products = data
        .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    return Right(products);
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final box = await storage.getBox('products');

    await box.clear();
    await box.put('products', products.map((e) => e.toJson()).toList());
  }
}
