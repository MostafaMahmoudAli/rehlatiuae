import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/blog_container_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import '../../../../our_blogs/data/models/blogs_model.dart';

class OurBlogSection extends StatelessWidget {
  const OurBlogSection({super.key, required this.blogs});
final List<Blogs>blogs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: LocaleKeys.Our_Blog,
          onPressed: ()
          {
            context.push(AppRoutesString.ourBlogsScreen);
          },
        ),
        SizedBox(
          height: 330.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index)
              {
                // blogs[index].trips?[index].reviews?[index].starsNumber.toString();
                // List<Trips>?trips=blogs[index].trips;
                return  BlogContainerItem(
                  blogs: blogs[index],
                  reviewStars:   "",
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
