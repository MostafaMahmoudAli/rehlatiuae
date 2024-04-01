import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/all_trips_body.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/widgets/best_trips_bottom_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/core/utils/search_text_feild.dart';

import '../../../../core/utils/injector.dart';
import '../blocs/best_trips_bloc.dart';

class BestTripsScreen extends StatelessWidget {
  BestTripsScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController bestTripsScrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<BestTripsBloc>()..add(GetBestTripsEvent()),
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
            controller: bestTripsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  controller: _textEditingController,
                ),
                const CustomSizedBox(),
                const Text(
                  AppStrings.bestTripsTitle,
                ),
                const CustomSizedBox(),
                 AllTripsBody(bestTripsScrollController: bestTripsScrollController,),
                const CustomSizedBox(),
                const BestTripsBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

