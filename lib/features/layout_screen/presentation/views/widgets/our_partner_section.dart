import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/our_partners_item.dart';

import '../../../data/models/our_partners_model.dart';

class OurPartnerSection extends StatelessWidget
{
  const OurPartnerSection({super.key, required this.ourPartners});
  final List<OurPartners>ourPartners;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.ourPartnerTitle,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 10.0.h,),
        SizedBox(
          height: 100.0.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ourPartners.length,
              itemBuilder: (context, index)
              {
                return  OurPartnersItem(ourPartners: ourPartners[index],);
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
