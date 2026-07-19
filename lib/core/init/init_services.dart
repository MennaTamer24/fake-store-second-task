import 'package:fake_store_second_task/core/di/service_locator.dart';
import 'package:fake_store_second_task/core/services/cache/cache_services.dart';
import 'package:flutter/material.dart';

class InitService {
  InitService._();

  static InitService? _instance;

  static InitService get instance {
    _instance ??= InitService._();
    return _instance!;
  }

  // factory InitService() {
  //   return instance;
  // }
  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheServices.init();
    initCore();
    await sl<CacheServices>().openBox('products');
    await sl<CacheServices>().openBox('favorites');
    init();
  }
}
