import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_body.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_bottom_section.dart';

import '../blocs/popular_experiences_bloc.dart';

class PopularExperiencesScreen extends StatelessWidget {
  PopularExperiencesScreen({super.key});

  final ScrollController popularExperiencesScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: BlocProvider(
        create: (context)=>getIt<PopularExperiencesBloc>()..add(GetPopularExperiencesEvent()),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            controller:popularExperiencesScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                const Text(
                  AppStrings.popularExperiencesTitle,
                ),
                const CustomSizedBox(),
                 PopularExperiencesBody(popularExperiencesScrollController: popularExperiencesScrollController,),
                const CustomSizedBox(),
                const PopularExperiencesBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


