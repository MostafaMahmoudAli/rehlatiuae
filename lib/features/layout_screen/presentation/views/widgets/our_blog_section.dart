import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/blog_container_item.dart';

import '../../../../our_blogs/data/models/blogs_model.dart';

class OurBlogSection extends StatelessWidget {
  const OurBlogSection({super.key, required this.blogs});
final List<Blogs>blogs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:10.0.w),
          child: CustomRowTitle(
            text: AppStrings.ourBlogTitle,
            onPressed: ()
            {
              context.push(AppStrings.ourBlogsScreen);
            },
          ),
        ),
        SizedBox(
          height: 330.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index)
              {
                return  BlogContainerItem(
                  blogs: blogs[index],
                  reviewStars:blogs[index].reviewAverage.toString(),
                );
              },
              separatorBuilder: (context, index)
              {
                return SizedBox(
                  width: 5.0.w,
                );
              }),
        ),
      ],
    );
  }
}
