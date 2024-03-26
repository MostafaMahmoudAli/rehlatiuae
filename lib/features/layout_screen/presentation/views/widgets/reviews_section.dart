import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          AppStrings.reviewTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const CustomSizedBox(),
        CustomCircleAvatar(
          radius: 40.0.r,
          backgroundImage: const AssetImage(
            "assets/images/Ellipse 1.png",
          ),
        ),
         Text(
          AppStrings.weHelpYouMakeBestTripDescription,
          style: Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 6,
        ),
        const CustomSizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircleAvatar(
              radius: 15.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            CustomCircleAvatar(
              radius: 15.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            CustomCircleAvatar(
              radius: 15.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            CustomCircleAvatar(
              radius: 15.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
            SizedBox(
              width: 5.0.w,
            ),
            CustomCircleAvatar(
              radius: 40.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.0.h,
        ),
         Text(
          AppStrings.subscribeToNewsletterTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width: 100.0.w,
                height: 60.0.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  border: Border.all(color: AppColors.greySearchText),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.reviewTextFieldName,
                    hintStyle: Theme.of(context).textTheme.headlineSmall,

                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0.h,
            ),
            Expanded(
              child: Container(
                width: 100.0.w,
                height: 60.0.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  border: Border.all(color: AppColors.greySearchText),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.reviewTextFieldEmail,
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0.h,
        ),
        CustomActionButton(
          text: AppStrings.reviewActionButtonName,
          borderRadius: BorderRadius.circular(8.0.r),
          backGroundColor: AppColors.textAndBackgroundColorButton,
          onTap: () {},
          width: double.infinity,
          height: 30.0.h,
        ),
        SizedBox(
          height: 50.0.h,
        ),
         Text(
          AppStrings.copyRight,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize:14.0.sp,),
        ),
      ],
    );
  }
}
