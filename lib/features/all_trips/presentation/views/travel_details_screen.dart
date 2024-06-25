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
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_preferences_list.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class TravelDetailsScreen extends StatefulWidget {
  final Trips trip;

  const TravelDetailsScreen({
    required this.trip,
    super.key,
  });

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  int totalRating = 0;
  double aveRating = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.pop(isFavorite);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BolgTravelTitleSection(
                title: widget.trip.name ?? '',
                address: widget.trip.address ?? '',
                price: widget.trip.adultPrice.toString(),
                imagePath: widget.trip.imagePath!,
                isFavorite: widget.trip.isFavourite,
                saving: widget.trip.saving.toString(),
                beforePrice: widget.trip.beforePrice.toString(),
                onLikePressed: (isFavorite) async {
                  setState(() {
                    this.isFavorite = isFavorite;
                  });
                  await context.read<MainCubit>().addToFavourite(tripId: widget.trip.id ?? 0);
                },
              ),
              if (widget.trip.offers!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Text(
                    LocaleKeys.Select_your_Preferences.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              if (widget.trip.offers!.isNotEmpty)
                OfferPreferencesList(
                  trip: widget.trip,
                  offers: [widget.trip, ...widget.trip.offers!],
                ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomActionButton(
                  text: LocaleKeys.Book_Now.tr(),
                  borderRadius: BorderRadius.circular(16),
                  backGroundColor: AppColors.textAndBackgroundColorButton,
                  onTap: () {
                    var cubit = context.read<TripCheckoutDetailsCubit>();
                    if (!cubit.isTripSelected && cubit.selectedOffers.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: LocaleKeys.You_must_select_trip_or_offer_at_latest.tr(),
                          subtitle: LocaleKeys.Sorry.tr() ,
                          labelText: LocaleKeys.Close.tr(),
                          color: AppColors.redAppColor,
                        ),
                      );
                      return;
                    }
                    cubit.selectedTrip = widget.trip;
                    context.push(AppRoutesString.paymentOptionsScreen).then(
                          (value) => cubit.onClosePaymentOptionsScreen(),
                        );
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                  },
                  width: double.infinity,
                  height: 50.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Text(
                  widget.trip.description!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ),
              ...List.generate(
                widget.trip.addresses!.length,
                (index) => CustomExpansionTile(
                  initiallyExpanded: index == 0,
                  title: widget.trip.addresses![index].name,
                  content: widget.trip.addresses![index].description,
                ),
              ),
              PreviewTravelsSection(images: widget.trip.images, aveRating: aveRating),
              RatingsReviewsSection(
                reviews: widget.trip.reviews,
                id: widget.trip.id,
                reviewsCount: widget.trip.reviewsCount,
                aveRating: aveRating,
                totalRating: totalRating,
              ),
              const ExperiencesSections(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    totalRating = widget.trip.reviewsCount!.oneStar! +
        widget.trip.reviewsCount!.towStar! +
        widget.trip.reviewsCount!.threeStar! +
        widget.trip.reviewsCount!.fourStar! +
        widget.trip.reviewsCount!.fiveStar!;

    aveRating = 0;
    if (totalRating != 0) {
      aveRating = (widget.trip.reviewsCount!.oneStar! +
              widget.trip.reviewsCount!.towStar! * 2 +
              widget.trip.reviewsCount!.threeStar! * 3 +
              widget.trip.reviewsCount!.fourStar! * 4 +
              widget.trip.reviewsCount!.fiveStar! * 5) /
          totalRating;
    }
    isFavorite = widget.trip.isFavourite!;
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
