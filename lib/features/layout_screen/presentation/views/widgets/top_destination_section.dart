import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

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
            context.push(AppStrings.topDestinationScreen);
          },
          text: AppStrings.topDestinationTitle,
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()
                  {
                    context.push(AppStrings.cityDestinationScreen);
                  },
                  child: CustomContainerTrip(
                    width:200.0.w,
                    cityName: destinations[index].name ?? "Dubai",
                    countryName:destinations[index].country ??"United Arab Emirates",
                    imageName: destinations[index].imagePath ??AppStrings.containerTripBackgroundImage,
                  ),
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
