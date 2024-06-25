import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../data/models/blogs_model.dart';

class BlogContainerItem extends StatelessWidget {
  const BlogContainerItem({
    super.key,
    required this.blogs,
    this.reviewStars,
  });

  final Blogs? blogs;
  final String? reviewStars;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutesString.blogScreen, extra: blogs);
      },
      child: SizedBox(
        height: 330.0.h,
        width: 240.0.w,
        child: Stack(
          children: [
            Container(
              height: 330.0.h,
              width: 240.0.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    blogs?.imagePath ?? "",
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.013,
              left: MediaQuery.sizeOf(context).width * 0.025,
              child: Container(
                width: 60.0.w,
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
                      reviewStars ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.013,
              right: MediaQuery.sizeOf(context).width * 0.025,
              child: Container(
                width: 92.0.w,
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
                        blogs?.createdAt?.toString() ?? "",
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 10.0.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0.w,
                  vertical: 12.0.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.0.w,
                      child: Text(
                        blogs?.name ?? LocaleKeys.Blog_name.tr(),
                        style: Theme.of(context).textTheme.displayMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 6.0.h,
                    ),
                    SizedBox(
                      width: 220.0.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        blogs?.description ?? LocaleKeys.Short_Description.tr(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
