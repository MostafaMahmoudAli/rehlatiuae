import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_preferences_list.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class TravelDetailsScreen extends StatefulWidget {
  const TravelDetailsScreen({super.key});

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const BolgTravelTitleSection(
            title: "IMG Worlds",
            address: LocaleKeys.Dubai_United,
            price: "79",
            imagePath: AppAssets.travel,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              LocaleKeys.Select_your_Preferences,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const OfferPreferencesList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
                      LocaleKeys.The_mighty,
                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          const CustomExpansionTile(
            title: LocaleKeys.Highlights,
            content:
           LocaleKeys.With_more_techy  ),
          const CustomExpansionTile(
            title: LocaleKeys.Inclusions,
            content: LocaleKeys.Guests_served,
            initiallyExpanded: false,
          ),
          const CustomExpansionTile(
            title: LocaleKeys.Cancellation_policy,
            content: LocaleKeys.Reviews_Rehlatyuae,
            initiallyExpanded: false,
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
