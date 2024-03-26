import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';

class BestOffersSection extends StatelessWidget {
  const BestOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: AppStrings.bestOffersTitle,
          onPressed: () {
            context.push(AppStrings.bestOffersScreen);
          },
        ),
        Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return BestOffersItem(
                  width: 74.0.w,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.0.h,
                );
              },
              itemCount: 3,
            ),
            Positioned(
              bottom: 160,
              right: 0,
              child: Container(
                width: 40.0.w,
                height: 35.0.h,
                decoration: BoxDecoration(
                  // image:  DecorationImage(
                  //   image: AssetImage(AppStrings.whatsUpLogo,),
                  // ),
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0.r),
                    bottomLeft: Radius.circular(8.0.r),
                  ),
                ),
                child: Image.asset(
                  AppStrings.whatsUpLogo,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
