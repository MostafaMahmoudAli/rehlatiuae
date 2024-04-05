import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/all_categories_body.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/categories_bottom_section.dart';

import '../../../../core/utils/injector.dart';
import '../blocs/categories_bloc.dart';

class AllCategoriesScreen extends StatelessWidget {
   AllCategoriesScreen({super.key});
   final ScrollController scrollCategoriesController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(),
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
                const CustomSizedBox(),
                const Text(
                  AppStrings.allCategoriesTitle,
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

