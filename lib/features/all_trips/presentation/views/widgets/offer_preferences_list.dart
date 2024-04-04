import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_card.dart';

class OfferPreferencesList extends StatelessWidget {
  final List<Trips>? offers;
  final Trips trip;

  const OfferPreferencesList({
    required this.trip,
    this.offers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: offers!.length,
        itemBuilder: (context, index) => OfferCard(
          offer: offers![index],
          trip: trip,
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}
