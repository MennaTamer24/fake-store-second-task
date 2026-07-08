import 'package:dartz/dartz.dart';
import 'package:fake_store_second_task/core/errors/failures.dart';
import 'package:fake_store_second_task/core/netwotk/network_check.dart';
import 'package:fake_store_second_task/features/products/data/repo/locale_data_source.dart';
import 'package:fake_store_second_task/features/products/data/repo/remote_data_source.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> getProductById(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  final LocaleDataSource localeDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localeDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.hasInternet()) {
      final result = await remoteDataSource.getAllProducts();

      return await result.fold((failure) async => Left(failure), (
        products,
      ) async {
        await localeDataSource.cacheProducts(products);
        return Right(products);
      });
    } else {
      return localeDataSource.getCachedProducts();
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(int id) async {
    return remoteDataSource.getProductById(id);
  }
}
