import 'package:easy_localization/easy_localization.dart';
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
import 'package:rehlatyuae/generated/locale_keys.g.dart';


class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           BolgTravelTitleSection(
            title: "IMG Worlds",
            address:  LocaleKeys.Dubai_United.tr() ,
            price: "79",
            imagePath: AppAssets.travel,
            isOffer: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(LocaleKeys.The_mighty.tr(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
           CustomExpansionTile(
            title: LocaleKeys.Highlights.tr(),
            content:
                 LocaleKeys.With_more_techy.tr()),
           CustomExpansionTile(
            title: LocaleKeys.Inclusions.tr(),
            content: LocaleKeys.Guests_served.tr(),
            initiallyExpanded: false,
          ),
           CustomExpansionTile(
            title: LocaleKeys.Cancellation_policy.tr(),
            content:LocaleKeys.Reviews_Rehlatyuae.tr(),
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
