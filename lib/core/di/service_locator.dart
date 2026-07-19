import 'package:dio/dio.dart';
import 'package:fake_store_second_task/core/services/cache/cache_services.dart';
import 'package:fake_store_second_task/core/services/netwotk/api_services.dart';
import 'package:fake_store_second_task/core/services/netwotk/network_check.dart';
import 'package:fake_store_second_task/features/favorite/data/favorite_repository.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_controller.dart';
import 'package:fake_store_second_task/features/products/data/repo/locale_data_source.dart';
import 'package:fake_store_second_task/features/products/data/repo/products_repo.dart';
import 'package:fake_store_second_task/features/products/data/repo/remote_data_source.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initCore() {
  sl.registerLazySingleton<CacheServices>(() => CacheServices());
}

void init() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiServices>(() => ApiServices(dio: sl<Dio>()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(sl<ApiServices>()),
  );

  sl.registerLazySingleton<LocaleDataSource>(
    () => LocaleDataSourceImpl(sl<CacheServices>()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl<RemoteDataSource>(),
      localeDataSource: sl<LocaleDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(
      cacheServices: sl<CacheServices>(),
      productRepository: sl<ProductRepository>(),
    ),
  );

  sl.registerFactory(
    () => ProductsCubit(productRepository: sl<ProductRepository>()),
  );

  sl.registerFactory(
    () => FavoriteCubit(favoriteRepository: sl<FavoriteRepository>()),
  );
}
