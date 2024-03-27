import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/popular_experiences.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/all_trips_body.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_horizontal.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/reviews_section.dart';
import 'package:rehlatyuae/core/utils/search_text_feild.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/top_destination_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/we_help_you_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/why_choose_us_section.dart';

class BestTripsScreen extends StatelessWidget {
  BestTripsScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.0.h,
          horizontal: 17.0.w,
        ),
        child: SingleChildScrollView(
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
              const AllTripsBody(),
              const CustomSizedBox(),
              const TopDestinationSection(destinations: [],),
              const CustomSizedBox(),
              const BestOffersSection(bestOffers: [],),
              const CustomSizedBox(),
              const PopularExperiencesSection(),
              const CustomSizedBox(),
              const WhyChooseUsSection(),
              const CustomSizedBox(),
              const WeHelpYouSection(),
              CustomActionButton(
                onTap: ()
                {
                  context.push(AppStrings.allTripsScreen);
                },
                text: AppStrings.actionButtonName,
                height: 70.0.h,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12.0.r),
                backGroundColor: AppColors.orange,
                style:Theme.of(context).textTheme.displayLarge,
              ),
              const CustomSizedBox(),
              const BestOffersHorizontal(),
              const CustomSizedBox(),
              const ReviewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
