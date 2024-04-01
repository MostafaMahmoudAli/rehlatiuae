import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

import '../../../../best_trips/data/models/best_trips_model.dart';

class BestTripsSection extends StatelessWidget {
  const BestTripsSection({super.key, required this.bestTrips});
  final List<BestTrips>?bestTrips;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: AppStrings.bestTripsTitle,
          onPressed: ()
          {
            context.push(AppStrings.bestTripsScreen);
          },
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: bestTrips!.length,
              itemBuilder: (context, index) {
                return CustomContainerTrip(
                  width:200.0.w,
                  cityName: bestTrips?[index].name ?? "Dubai",
                  countryName:bestTrips?[index].address ??"United Arab Emirates",
                  imageName: bestTrips?[index].imagePath??AppStrings.containerTripBackgroundImage,
                  tripPrice:bestTrips?[index].adultPrice.toString()??"",
                  reservationType:"/person",
                  oldTripPrice:bestTrips?[index].beforePrice.toString() ?? "",
                  percentageSave: bestTrips?[index].saving ?? "" ,
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
