import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_container_trip.dart';

class CategoryNameBody extends StatelessWidget {
  const CategoryNameBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        crossAxisSpacing:10.0.w,
        mainAxisSpacing: 15.0.w,
        mainAxisExtent: 170.0.h,
        childAspectRatio: 7/6.6,
      ),
      itemBuilder: (context, index) => CustomContainerTrip(
        width: 200.0.w,
        cityName: "Dubai",
        countryName: "United Arab Emirates",
        imageName: AppStrings.containerTripBackgroundImage,
        tripPrice: "43",
        reservationType: "/person",
      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
