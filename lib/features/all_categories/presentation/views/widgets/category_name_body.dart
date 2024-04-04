import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
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
        cityName: LocaleKeys.Dubai.tr(),
        countryName: LocaleKeys.United_Arab_Emirates.tr(),
        imageName: AppStrings.containerTripBackgroundImage.tr(),
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
