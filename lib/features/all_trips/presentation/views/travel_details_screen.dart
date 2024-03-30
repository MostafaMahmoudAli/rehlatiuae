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
            address: "Dubai, United Arab Emirates",
            price: "79",
            imagePath: AppAssets.travel,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              "Select your Preferences",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const OfferPreferencesList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              'The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          const CustomExpansionTile(
            title: "Highlights",
            content:
                "With more techy bells n’ webullish than our free version.With more techy bells n’ webullish than our free version.",
          ),
          const CustomExpansionTile(
            title: "Inclusions",
            content: "14,000+ Guests served",
            initiallyExpanded: false,
          ),
          const CustomExpansionTile(
            title: "Cancellation policy",
            content: "1000+ Reviews on Rehlatyuae by our Travelers",
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
