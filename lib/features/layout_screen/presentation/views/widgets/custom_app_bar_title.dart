import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        SvgPicture.asset(
          AppStrings.appLogo,
          width: 80.0.w,
          height: 80.0.h,
        ),
        SizedBox(
          width: 15.0.w,
        ),
        Column(
          children: [
            Text(
              "00,00 USD",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16.0.sp,
              ),
            ),
            SizedBox(
              height: 4.0.h,
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.Hello.tr(),
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.0.sp,
                  ),
                ),
                Text(
                  'belal' ,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: AppColors.textAndBackgroundColorButton,
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
