import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_preferences_list.dart';
import 'package:rehlatyuae/features/popular_experiences/data/models/popular_experiences_model.dart';

class TravelDetailsScreen extends StatefulWidget {
  final PopularExperiences? popularExperiences;

  const TravelDetailsScreen({super.key, this.popularExperiences});

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BolgTravelTitleSection(
            title: widget.popularExperiences!.name,
            address: widget.popularExperiences!.address,
            price: widget.popularExperiences!.adultPrice.toString(),
            imagePath: widget.popularExperiences!.imagePath!,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              "Select your Preferences",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          OfferPreferencesList(offers: widget.popularExperiences!.offers),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              widget.popularExperiences!.description!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          ...List.generate(
            widget.popularExperiences!.addresses!.length,
            (index) => CustomExpansionTile(
              initiallyExpanded: index == 0,
              title: widget.popularExperiences!.addresses![index].name,
              content: widget.popularExperiences!.addresses![index].description,
            ),
          ),
          // TODO
          PreviewTravelsSection(popularExperiences: widget.popularExperiences),
          RatingsReviewsSection(reviews: widget.popularExperiences!.reviews),
          const ExperiencesSections(),
        ],
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
