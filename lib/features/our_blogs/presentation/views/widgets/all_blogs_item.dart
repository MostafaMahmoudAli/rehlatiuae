import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class AllBlogsItem extends StatelessWidget {
  const AllBlogsItem({
    super.key,
    required this.width,
    required this.image,
     this.rating,
    required this.createdAt,
    required this.name,
    required this.description,
  });

  final double width;
  final String? image;
  final String? rating;
  final String? createdAt;
  final String? name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.0.h,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 185.0.h,
            width: width,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15.0.r),
              image:DecorationImage(
                image:CachedNetworkImageProvider(
                  image ?? "",
                ) ,
                fit:BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            child: Container(
              width: 40.0.w,
              height: 30.0.h,
              decoration: BoxDecoration(
                color: AppColors.blogItemBackgroundColor.withOpacity(0.3),
                borderRadius: BorderRadiusDirectional.circular(12.0.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_border,
                    color: AppColors.whiteAppColor,
                  ),
                  Text(
                    rating ?? "",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 5,
            child: Container(
              width: 72.0.w,
              height: 30.0.h,
              decoration: BoxDecoration(
                color: AppColors.blogItemBackgroundColor.withOpacity(0.3),
                borderRadius: BorderRadiusDirectional.circular(12.0.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.whiteAppColor,
                  ),
                  Expanded(
                    child: Text(
                      createdAt ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                      overflow:TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120.0.w,
                  child: Text(
                    name ?? "",
                    style: Theme.of(context).textTheme.displayMedium,
                    overflow:TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                SizedBox(
                  width:115.0.w,
                  child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                     description ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
