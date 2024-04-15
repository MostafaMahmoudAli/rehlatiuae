import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/category_name_body.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/widgets/category_name_bottom_section.dart';
import '../../../../core/utils/custom_sized_box.dart';
import '../../data/models/categories_model.dart';
import '../blocs/category_name_cubit.dart';

class CategoryNameScreen extends StatelessWidget {
  const CategoryNameScreen({super.key, required this.category});

  final Categories category;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(),
      body: BlocProvider(
        create: (context) => getIt<CategoryNameCubit>()..fetchCategoryNameTrips(categoryNameId: category.id ?? 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsetsDirectional.symmetric(horizontal:15.0.w,),
                child: Text(
                  category.name ?? "",
                ),
              ),
              const CustomSizedBox(),
              const CategoryNameBody(),
              const CustomSizedBox(),
              const CategoryNameBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
