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
  const TopDestinationSection({super.key,required this.destinations});
  final List<AllDestinations>destinations;
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
         CustomRowTitle(
          onPressed:()
          {
            context.push(AppRoutesString.topDestinationScreen);
          },
          text: LocaleKeys.All_Destinations,
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()
                  {
                    context.push(AppRoutesString.cityDestinationScreen);
                  },
                  child: CustomContainerTrip(
                    width:200.0.w,
                    cityName: destinations[index].name ?? LocaleKeys.Dubai,
                    countryName:destinations[index].country ?? LocaleKeys.United_Arab_Emirates,
                    imageName: destinations[index].imagePath ?? AppStrings.containerTripBackgroundImage,
                  ),
                );
              },
              separatorBuilder: (context, index)
              {
                return SizedBox(
                  width: 5.0.w,
                );
              }),
        ),
      ],
    );
  }
}
