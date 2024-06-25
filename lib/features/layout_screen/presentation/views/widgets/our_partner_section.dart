import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/our_partners_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

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
         Padding(
           padding:EdgeInsetsDirectional.only(
             start: 10.0.w,
             end: 10.0.w,
             bottom: 10.0.h,
           ),
           child: Text(
             LocaleKeys.Our_Partner.tr(),
             style: const TextStyle(
               color: AppColors.black,
             ),
           ),
         ),
        SizedBox(height: 10.0.h,),
        SizedBox(
          height: 100.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal:15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: ourPartners.length,
              physics:const BouncingScrollPhysics(),
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
