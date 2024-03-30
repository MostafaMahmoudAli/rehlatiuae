import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_card.dart';

class OfferPreferencesList extends StatelessWidget {
  const OfferPreferencesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const OfferCard(),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}
