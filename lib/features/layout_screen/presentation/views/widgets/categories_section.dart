import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

import '../../../../all_categories/data/models/categories_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection(
      {super.key,required this.categories});

  final List<Categories>categories;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: AppStrings.categoriesTitle,
          onPressed: () {
            context.push(AppStrings.allCategoriesScreen);
          },
        ),
        SizedBox(
          height: 40.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push(AppStrings.categoryNameScreen);
                  },
                  child: CategoriesItem(
                    categoryName:categories[index].name,
                    image:categories[index].imagePath,
                    height: 40.0.h,
                    width: 110.0.w,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.0.w,
                );
              }),
        ),
      ],
    );
  }
}
