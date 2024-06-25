import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../all_categories/data/models/categories_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection(
      {super.key,required this.categories});

  final List<Categories>?categories;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsetsDirectional.only(
            start: 10.0.w,
            end: 10.0.w,
            bottom: 10.0.h,
          ),
          child: CustomRowTitle(
            text:  LocaleKeys.Categories.tr(),
            onPressed: () {
              context.push(AppRoutesString.allCategoriesScreen);
            },
          ),
        ),
        SizedBox(
          height: 40.0.h,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(horizontal:15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: categories?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push(AppRoutesString.categoryNameScreen,extra:categories?[index]);
                  },
                  child: CategoriesItem(
                    categoryName:categories?[index].name ?? "",
                    image:categories?[index].imagePath ?? "",
                    height: 40.0.h,
                    width: 110.0.w,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.0.w,
                );
              }),
        ),
      ],
    );
  }
}
