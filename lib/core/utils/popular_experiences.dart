import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_contanier_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import '../../features/all_trips/data/models/trips_model.dart';


class PopularExperiencesSection extends StatelessWidget {
  const PopularExperiencesSection({super.key, required this.popularExperiences});
  final List<Trips>?popularExperiences;
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        CustomRowTitle(
          text: LocaleKeys.Popular_Experiences.tr(),
          onPressed: ()
          {
            context.push(AppRoutesString.popularExperiencesScreen);
          },
        ),
        SizedBox(
          height:190.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: popularExperiences!.length,
              itemBuilder: (context, index) {
                return PopularExperiencesContainerItem(
                  width : 150.0.w,
                  percentageSave:popularExperiences?[index].saving ?? "",
                  oldTripPrice:popularExperiences?[index].beforePrice?? "",
                  popularExperiences:popularExperiences?[index],
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
