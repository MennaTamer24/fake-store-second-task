import 'package:fake_store_second_task/core/utils/app_strings.dart';
import 'package:fake_store_second_task/core/utils/app_text_styles.dart';
import 'package:fake_store_second_task/features/products/presentation/views/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(AppStrings.products, style: AppTextStyles.title),
      ),
      body: const HomeBodyWidget(),
    );
  }
}
