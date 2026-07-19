import 'package:fake_store_second_task/app/products_app.dart';
import 'package:fake_store_second_task/core/init/init_services.dart';
import 'package:flutter/material.dart';

void main() async {
  await InitService.instance.initApp();
  runApp(const ProductsApp());
}
