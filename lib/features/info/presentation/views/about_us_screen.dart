import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/features/info/presentation/views/widgets/title_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const TitleSection(
            title: LocaleKeys.About_Us,
            subTitle: LocaleKeys.About_Rehlatyuae,
            imagePath: AppAssets.rectangle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
              top: 34.h,
            ),
            child: Text(
               LocaleKeys.The_mighty,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: AppColors.backgroundColorExpansionAndText,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(9.r),
              ),
            ),
            child: Text(
              LocaleKeys.The_mighty,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
          const CustomExpansionTile(
            title: LocaleKeys.Start_date_Rehlatyuae,
            content: LocaleKeys.Founding_Year_of_Rehlatyuae,
          ),
          const CustomExpansionTile(
            title: LocaleKeys.Number_of_our_clients,
            content:  LocaleKeys.Guests_served,
          ),
          const CustomExpansionTile(
            title: LocaleKeys.Number_of_evaluations_received,
            content:  LocaleKeys.Reviews_Rehlatyuae,
          ),
          const PreviewTravelsSection(hasBookButton: false),
          const ExperiencesSections(),
        ],
      ),
    );
  }
}
