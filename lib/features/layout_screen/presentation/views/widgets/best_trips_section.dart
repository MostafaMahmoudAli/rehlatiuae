import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../all_trips/data/models/trips_model.dart';

class BestTripsSection extends StatelessWidget {
  const BestTripsSection({super.key, required this.bestTrips});

  final List<Trips>? bestTrips;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: LocaleKeys.Best_Trips.tr(),
          onPressed: () {
            context.push(
                AppRoutesString.bestTripsScreen
            );
          },
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: bestTrips!.length,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomContainerTrip(
                  width: 200.0.w,
                  trip: bestTrips?[index],
                  cityName: bestTrips?[index].name ?? "",
                  countryName: bestTrips?[index].address ?? "",
                  imageName: bestTrips?[index].imagePath ?? "",
                  tripPrice: bestTrips?[index].adultPrice.toString() ?? "",
                  reservationType: "/person",
                  oldTripPrice: bestTrips?[index].beforePrice.toString() ?? "",
                  percentageSave: bestTrips?[index].saving ?? "",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.0.w,
                );
              }),
        ),
      ],
    );
  }
}
