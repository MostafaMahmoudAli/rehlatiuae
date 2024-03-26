import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

class TopDestinationSection extends StatelessWidget {
  const TopDestinationSection({super.key});

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
                    cityName: "Dubai",
                    countryName:"United Arab Emirates",
                    imageName: AppStrings.containerTripBackgroundImage,
                    tripPrice:"43",
                    reservationType:"/person",
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
