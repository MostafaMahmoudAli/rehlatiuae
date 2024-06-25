import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/why_choose_us_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            LocaleKeys.Why_Choose_Us.tr(),
            style: const TextStyle(
              color: AppColors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WhyChooseUSItem(
                text: LocaleKeys.Fast_booking.tr(),
                descriptionText: LocaleKeys.At_Rehlatiuae_you_only.tr(),
                descriptionTextStyle: Theme.of(context).textTheme.bodyLarge,
                child: Image.asset(AppStrings.whyChooseUsFastBookingImage),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              WhyChooseUSItem(
                text: LocaleKeys.Easy_to_Shop.tr(),
                descriptionText: LocaleKeys.No_pain_only_gain.tr(),
                descriptionTextStyle: Theme.of(context).textTheme.bodyLarge,
                child: Image.asset(AppStrings.whyChooseUsEasyToShopImage),
              ),
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WhyChooseUSItem(
                text: LocaleKeys.Support.tr(),
                descriptionText: LocaleKeys.With_quality_support.tr(),
                descriptionTextStyle: Theme.of(context).textTheme.bodyLarge,
                child: Image.asset(AppStrings.whyChooseUs247SupportImage),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              WhyChooseUSItem(
                text: LocaleKeys.Unique_experience.tr(),
                descriptionText: LocaleKeys.Offbeat_or_mainstream.tr(),
                descriptionTextStyle: Theme.of(context).textTheme.bodyLarge,
                child: Image.asset(AppStrings.whyChooseUsUniqueexPerienceImage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
