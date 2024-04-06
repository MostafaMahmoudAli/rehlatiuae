import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/custom_container_trip.dart';
import '../../../data/models/city_destination_model.dart';

class CityDestinationBody extends StatelessWidget {
  const CityDestinationBody({super.key, required this.cityDestination});

  final CityDestination? cityDestination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 11.0.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0.w,
          mainAxisSpacing: 15.0.w,
          childAspectRatio:MediaQuery.sizeOf(context).aspectRatio/0.55,
        ),
        itemBuilder: (context, index) => CustomContainerTrip(
          width: 200.0.w,
          trip: cityDestination?.trips?[index],
          cityName: cityDestination?.trips?[index].name ?? "",
          countryName: cityDestination?.trips?[index].description ?? "",
          imageName: cityDestination?.trips?[index].imagePath ?? "",
          tripPrice: cityDestination?.trips?[index].adultPrice.toString() ?? "",
          reservationType: "/person",
        ),
        itemCount: cityDestination?.trips?.length ?? 0,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
