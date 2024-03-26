import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomRowTitle(
          text: AppStrings.categoriesTitle,
          onPressed:()
          {
            context.push(AppStrings.allCategoriesScreen);
          },
        ),
        SizedBox(
          height:40.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return   InkWell(
                  onTap: ()
                  {
                    context.push(AppStrings.categoryNameScreen);
                  },
                  child: CategoriesItem(
                    height:40.0.h,
                    width: 75.0.w,
                  ),
                );
              },
              separatorBuilder: (context, index)
              {
                return SizedBox(
                  width: 10.0.w,
                );
              }),
        ),
      ],
    );
  }
}
