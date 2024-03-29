import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/widgets/popular_experiences_contanier_item.dart';
import '../../features/popular_experiences/data/models/popular_experiences_model.dart';


class PopularExperiencesSection extends StatelessWidget {
  const PopularExperiencesSection({super.key, required this.popularExperiences});
  final List<PopularExperiences>?popularExperiences;
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        CustomRowTitle(
          text: AppStrings.popularExperiencesTitle,
          onPressed: ()
          {
            context.push(AppStrings.popularExperiencesScreen);
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
