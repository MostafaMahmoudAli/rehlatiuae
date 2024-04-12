import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_horizontal_item.dart';

import '../../../../all_trips/data/models/trips_model.dart';

class BestOffersHorizontal extends StatelessWidget {
  const BestOffersHorizontal({
    super.key,
    required this.bestOffers,
  });

  final List<Trips> bestOffers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.0.h,
        ),
        SizedBox(
          height: 150.0.h,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12.0.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BestOffersHorizontalItem(
                width: 70.0.w,
                offer: bestOffers[index],
                review: bestOffers[index].reviewAverage ?? 0.0,
              );
            },
            itemCount: 5,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.0.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
