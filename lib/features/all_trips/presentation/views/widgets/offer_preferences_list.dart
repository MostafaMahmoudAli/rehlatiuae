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
      height: 470.h,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              offers!.length,
              (index) => Row(
                children: [
                  OfferCard(
                    offer: offers![index],
                    trip: trip,
                    isTripSelected: index == 0,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
