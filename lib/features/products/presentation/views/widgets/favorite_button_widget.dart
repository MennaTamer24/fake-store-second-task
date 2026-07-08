import 'package:fake_store_second_task/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(
            isFavorite ? Assets.heartFilled : Assets.heart,
            width: 32.w,
            height: 32.h,
          ),
        ),
      ),
    );
  }
}
