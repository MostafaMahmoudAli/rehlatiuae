import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_count_tickets_section.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            AppAssets.travel,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ).copyWith(top: 15.h),
                    child: Text(
                      'offer name',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$92",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      ' /Person',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.sp),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                OfferCountTicketsSection(
                  adultCost: 100,
                  childCost: 50,
                  onChildrenCountChange: (count, total) {},
                  onAdultsCountChange: (count, total) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomActionButton(
                        text: 'select',
                        borderRadius: BorderRadius.circular(15.sp),
                        backGroundColor: AppColors.textAndBackgroundColorButton,
                        onTap: () {},
                        width: 100.w,
                        height: 50.h,
                      ),
                      DefaultTextButton(
                        onPressed: () {},
                        text: 'view',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
