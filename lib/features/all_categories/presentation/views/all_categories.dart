import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/all_categories_body.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/categories_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/injector.dart';
import '../blocs/categories_bloc.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});

  final ScrollController scrollCategoriesController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 2.0.h,
          ),
          child: SingleChildScrollView(
            controller: scrollCategoriesController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 12.0.w,
                    end: 12.0.w,
                    bottom: 10.0.h,
                    top:10.0.h,
                  ),
                  child: Text(
                    LocaleKeys.All_Categories.tr(),
                  ),
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

