import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/paragraph_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           BolgTravelTitleSection(
            title: LocaleKeys.Blog_name.tr(),
            address: LocaleKeys.Dubai_United.tr(),
            price: "79",
            imagePath: AppAssets.travel,
            isTrip: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              LocaleKeys.The_mighty.tr(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
           ParagraphSection(
            title: LocaleKeys.Exciting_Activities_at.tr(),
            subTitle:
           LocaleKeys.The_mighty.tr()       
            ),
           ParagraphSection(
            title: LocaleKeys.KIDS_ADVENTURE.tr(),
            subTitle:
            LocaleKeys.The_mighty.tr(),  
           ),
           ParagraphSection(
            title: LocaleKeys.ARABIAN_VILLAGE.tr(),
            subTitle:
            LocaleKeys.The_mighty.tr(),    
            ),
          const PreviewTravelsSection(),
          const RatingsReviewsSection(),
          const ExperiencesSections(),
        ],
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
