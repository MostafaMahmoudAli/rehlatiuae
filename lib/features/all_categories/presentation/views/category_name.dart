import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/category_name_body.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/category_name_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_circle_avatar.dart';
import '../../../../core/utils/custom_sized_box.dart';
import '../../../layout_screen/presentation/views/custom_drawer.dart';
import '../../../layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import '../../data/models/categories_model.dart';
import '../blocs/category_name_cubit.dart';


class CategoryNameScreen extends StatelessWidget {
  const CategoryNameScreen({super.key, required this.category});
  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.whiteAppColor,
        title: const CustomAppBarTitle(),
        actions: [
          InkWell(
            onTap: () {},
            child: CustomCircleAvatar(
              radius: 40.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocProvider(
        create:(context)=>getIt<CategoryNameCubit>()..fetchCategoryNameTrips(categoryNameId: category.id ?? 0),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                 Text(
                  category.name ?? "",
                ),
                const CustomSizedBox(),
                const CategoryNameBody(),
                const CustomSizedBox(),
                const CategoryNameBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


