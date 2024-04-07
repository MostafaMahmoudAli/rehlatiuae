import 'package:easy_localization/easy_localization.dart' as s;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/why_choose_us_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class WeHelpYouSection extends StatelessWidget {
   WeHelpYouSection({super.key});

  String arabicKey = LocaleKeys.Arabic.tr();
 late bool isArabic = (arabicKey == 'Arabic');

// Now you can use `isArabic` as needed in your code

  bool isEnglish =true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.We_Help_You_Make_Best_Trip.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 6.0.h,
          ),
          Text(
            AppStrings.weHelpYouMakeBestTripDescription,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 290.0.h,
            child: Stack(
              children: [
                Container(
                  height: 190.0.h,
                  width: 130.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12.0.r),
                    image: const DecorationImage(
                      image: AssetImage(
                        AppStrings.weHelpYouMakeBestTripImage1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: isArabic  ? TextDirection.rtl : TextDirection.ltr,
                  top: 0,
                  start:MediaQuery.sizeOf(context).width * 0.1,
                  child: Container(
                    height: 140.0.h,
                    width: 110.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12.0.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          AppStrings.weHelpYouMakeBestTripImage2,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: isArabic  ? TextDirection.rtl : TextDirection.ltr,
                  top: MediaQuery.sizeOf(context).height * 0.19,
                  end: MediaQuery.sizeOf(context).width * 0.3,
                  child: Container(
                    height: 140.0.h,
                    width: 140.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12.0.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          AppStrings.weHelpYouMakeBestTripImage3,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Row(
            children: [
              WhyChooseUSItem(
                text: AppStrings.weHelpYouMakeBestTripSecondDescription,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
              WhyChooseUSItem(
                text: AppStrings.weHelpYouMakeBestTripSecondDescription,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Row(
            children: [
              WhyChooseUSItem(
                text: AppStrings.weHelpYouMakeBestTripSecondDescription,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
              SizedBox(
                width: 5.0.w,
              ),
              WhyChooseUSItem(
                text: AppStrings.weHelpYouMakeBestTripSecondDescription,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
