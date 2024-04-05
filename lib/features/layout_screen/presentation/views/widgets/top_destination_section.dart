import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../top_destinations_section/data/models/all_destination_model.dart';

class TopDestinationSection extends StatelessWidget {
  const TopDestinationSection({super.key, required this.destinations});

  final List<AllDestinations> destinations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsetsDirectional.only(
            start: 10.0.w,
            end: 10.0.w,
            bottom: 10.0.h,
          ),
          child: CustomRowTitle(
            onPressed: () {
              context.push(AppRoutesString.topDestinationScreen);
            },
            text: LocaleKeys.All_Destinations.tr(),
          ),
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
            padding:EdgeInsetsDirectional.symmetric(horizontal:15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push(
                      AppRoutesString.cityDestinationScreen,
                      extra: destinations[index].id,
                    );
                  },
                  child: CustomContainerTrip(
                    width: 200.0.w,
                    cityName: destinations[index].name ?? LocaleKeys.Dubai.tr(),
                    countryName:destinations[index].country ?? LocaleKeys.United_Arab_Emirates.tr(),
                    imageName: destinations[index].imagePath ?? AppStrings.containerTripBackgroundImage.tr(),
                    isTrip: false,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.0.w,
                );
              }),
        ),
      ],
    );
  }
}
