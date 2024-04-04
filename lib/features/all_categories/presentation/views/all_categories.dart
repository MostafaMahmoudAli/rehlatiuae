import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/all_categories_body.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/categories_bottom_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/core/utils/search_text_feild.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/injector.dart';
import '../blocs/categories_bloc.dart';

class AllCategoriesScreen extends StatelessWidget {
   AllCategoriesScreen({super.key});
   final TextEditingController _textEditingController = TextEditingController();
   final ScrollController scrollCategoriesController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: Scaffold(
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
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            controller: scrollCategoriesController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  controller: _textEditingController,
                ),
                const CustomSizedBox(),
                 Text(
                  LocaleKeys.All_Categories.tr(),
                ),
                const CustomSizedBox(),
                 AllCategoriesBody(
                  scrollCategoriesController: scrollCategoriesController,
                ),
                 const CategoriesBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

