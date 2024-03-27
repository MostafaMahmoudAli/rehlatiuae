import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.height, required this.width, required this.image, required this.categoryName});
  final double height;
  final double width;
  final String?image;
  final String?categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.categoriesItemTextColor.withOpacity(0.2),
        borderRadius: BorderRadiusDirectional.circular(10.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 4.0.w,
          ),
           Text(
            categoryName ?? "",
            style:Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10.0.sp),
          ),
        ],
      ),
    );
  }
}
