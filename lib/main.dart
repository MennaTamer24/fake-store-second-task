import 'package:fake_store_second_task/core/di/service_locator.dart';
import 'package:fake_store_second_task/core/extentions/context_extension.dart';
import 'package:fake_store_second_task/core/utils/app_routes.dart';
import 'package:fake_store_second_task/features/favorite/presentation/favorite_controller/favorite_controller.dart';
import 'package:fake_store_second_task/features/products/presentation/products_controller/products_controller.dart';
import 'package:fake_store_second_task/features/products/presentation/views/details_view.dart';
import 'package:fake_store_second_task/features/products/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('products');
  await Hive.openBox('favorites');
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProductsCubit>()),

        BlocProvider(create: (_) => sl<FavoriteCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),

        child: MaterialApp(
          initialRoute: AppRoutes.home,

          routes: {
            AppRoutes.home: (_) => const HomeView(),

            AppRoutes.details: (_) => const DetailsView(),
          },

          debugShowCheckedModeBanner: false,
          theme: AppThemeExtension.light(),
        ),
      ),
    );
  }
}
