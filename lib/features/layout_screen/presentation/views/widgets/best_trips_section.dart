import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

class BestTripsSection extends StatelessWidget {
  const BestTripsSection({super.key});

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
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomContainerTrip(
                  width:200.0.w,
                  cityName: "Dubai",
                  countryName:"United Arab Emirates",
                  imageName: AppStrings.containerTripBackgroundImage,
                  tripPrice:"43",
                  reservationType:"/person",
                  oldTripPrice: 100,
                  percentageSave: "Save 45 %" ,
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
