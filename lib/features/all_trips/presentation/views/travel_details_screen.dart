import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_preferences_list.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/popular_experiences/data/models/popular_experiences_model.dart';

class TravelDetailsScreen extends StatefulWidget {
  final PopularExperiences? trip;

  const TravelDetailsScreen({super.key, this.trip});

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
            title: widget.trip!.name,
            address: widget.trip!.address,
            price: widget.trip!.adultPrice.toString(),
            imagePath: widget.trip!.imagePath!,
            isFavorite: widget.trip!.isFavourite,
            onLikePressed: () async {
              await context.read<MainCubit>().addToFavourite(tripId: widget.trip!.id);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              "Select your Preferences",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          OfferPreferencesList(offers: widget.trip!.offers),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              widget.trip!.description!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          ...List.generate(
            widget.trip!.addresses!.length,
            (index) => CustomExpansionTile(
              initiallyExpanded: index == 0,
              title: widget.trip!.addresses![index].name,
              content: widget.trip!.addresses![index].description,
            ),
          ),
          PreviewTravelsSection(images: widget.trip!.images),
          RatingsReviewsSection(
            reviews: widget.trip!.reviews,
            id: widget.trip!.id,
          ),
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
