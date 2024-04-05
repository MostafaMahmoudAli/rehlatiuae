import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class OfferDetailsScreen extends StatefulWidget {
  final Trips? offer;
  final Trips? trip;

  const OfferDetailsScreen({super.key, required this.offer, this.trip});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  int totalRating = 0;
  double aveRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BolgTravelTitleSection(
            title: widget.offer!.name!,
            address: widget.trip!.address ?? '',
            price: widget.offer!.adultPrice.toString(),
            imagePath: widget.offer!.imagePath!,
            isOffer: true,
            isFavorite: widget.offer!.isFavourite,
            saving: widget.offer!.saving.toString(),
            beforePrice: widget.offer!.beforePrice.toString(),
            onLikePressed: () async {
              await context.read<MainCubit>().addToFavourite(tripId: widget.trip!.id ?? 8);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              widget.offer!.description!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          ...List.generate(
            widget.offer!.addresses!.length,
            (index) => CustomExpansionTile(
              initiallyExpanded: index == 0,
              title: widget.offer!.addresses![index].name,
              content: widget.offer!.addresses![index].description,
            ),
          ),
          PreviewTravelsSection(images: widget.trip!.images, aveRating: 0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            child: CustomActionButton(
              text: LocaleKeys.Book_Now.tr(),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: AppColors.textAndBackgroundColorButton,
              onTap: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                context.push(AppRoutesString.paymentOptionsScreen, extra: widget.trip);
              },
              width: double.infinity,
              height: 50.h,
            ),
          ),
          RatingsReviewsSection(
            reviews: widget.trip!.reviews,
            reviewsCount: widget.trip!.reviewsCount,
            aveRating: aveRating,
            totalRating: totalRating,
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
    totalRating = widget.trip!.reviewsCount!.oneStar! +
        widget.trip!.reviewsCount!.towStar! +
        widget.trip!.reviewsCount!.threeStar! +
        widget.trip!.reviewsCount!.fourStar! +
        widget.trip!.reviewsCount!.fiveStar!;

    aveRating = 0;
    if (totalRating != 0) {
      aveRating = (widget.trip!.reviewsCount!.oneStar! +
              widget.trip!.reviewsCount!.towStar! * 2 +
              widget.trip!.reviewsCount!.threeStar! * 3 +
              widget.trip!.reviewsCount!.fourStar! * 4 +
              widget.trip!.reviewsCount!.fiveStar! * 5) /
          totalRating;
      super.initState();
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
