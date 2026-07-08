import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fake_store_second_task/core/errors/failures.dart';
import 'package:fake_store_second_task/core/netwotk/api_services.dart';
import 'package:fake_store_second_task/core/utils/end_points.dart';
import 'package:fake_store_second_task/features/products/data/models/product_models.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> getProductById(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiServices apiServices;
  RemoteDataSourceImpl(this.apiServices);

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await apiServices.get(endpoint: EndPoints.products);
      final products = (response['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(int id) async {
    try {
      final response = await apiServices.get(
        endpoint: "${EndPoints.productById}$id",
      );
      final product = ProductModel.fromJson(response);
      return Right(product);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
