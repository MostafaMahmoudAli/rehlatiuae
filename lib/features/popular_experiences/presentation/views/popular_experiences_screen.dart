import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_body.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../blocs/popular_experiences_bloc.dart';

class PopularExperiencesScreen extends StatelessWidget {
  PopularExperiencesScreen({super.key});

  final ScrollController popularExperiencesScrollController = ScrollController();

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
                 Text(
                  LocaleKeys.Popular_Experiences.tr(),
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


