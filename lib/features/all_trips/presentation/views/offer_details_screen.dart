import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class OfferDetailsScreen extends StatefulWidget {
  final Trips? trip;

  const OfferDetailsScreen({super.key, required this.trip});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    getIt<Logger>().w(widget.trip.toString());
    return Scaffold(
      body: ListView(
        children: [
          BolgTravelTitleSection(
            title: widget.trip!.name!,
            address: widget.trip!.address ?? '',
            price: widget.trip!.adultPrice.toString(),
            imagePath: widget.trip!.imagePath!,
            isOffer: true,
            isFavorite: widget.trip!.isFavourite,
            onLikePressed: () async {
              await context.read<MainCubit>().addToFavourite(tripId: widget.trip!.id ?? 8);
            },
          ),
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
          // PreviewTravelsSection(popularExperiences: widget.trip),
          // RatingsReviewsSection(reviews: widget.trip!.reviews),
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
