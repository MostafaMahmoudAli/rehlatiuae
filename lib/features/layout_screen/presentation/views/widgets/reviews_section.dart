import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../data/models/review_model.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<Review>? reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.Our_Client_Reviews.tr(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const CustomSizedBox(),
        SizedBox(
          height: 350.0.h,
          child: ListView.separated(
            itemCount: reviews?.length ?? 0,
            physics: const BouncingScrollPhysics(),
            scrollDirection:Axis.horizontal,
            itemBuilder: (context, index)
            {
              return Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomCircleAvatar(
                        radius: 40.0.r,
                        backgroundImage: CachedNetworkImageProvider(
                          reviews?[index].client?.imagePath ??
                              "assets/images/Ellipse 1.png",
                        ),
                      ),
                       SizedBox(width: 60.0.w,),
                      if(reviews?[index].starsNumber!=null)
                      Row(
                        children: [
                          const Icon(
                              Icons.star,
                            color:AppColors.yellow,
                          ),
                          Text(
                           " ${reviews?[index].starsNumber.toString()}/5 ",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h,),
                  SizedBox(
                    width:210.0.w,
                    child: Expanded(
                      child: Text(
                       reviews?[index].description ?? "" ,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 10,
                        overflow:TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20.0.w,
            ),
          ),
        ),
        SizedBox(
          height: 40.0.h,
        ),
        Text(
          LocaleKeys.Subscribe_to_Newsletter.tr(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        const SubscriptionSection(),
        SizedBox(
          height: 50.0.h,
        ),
        Text(
          AppStrings.copyRight,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14.0.sp,
              ),
        ),
      ],
    );
  }
}

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  maxLines:2,
                  minLines:1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: LocaleKeys.Your_Name.tr(),
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
                  maxLines:2,
                  minLines:1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:LocaleKeys.Your_Email.tr(),
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
          text: LocaleKeys.Send_Now.tr(),
          borderRadius: BorderRadius.circular(8.0.r),
          backGroundColor: AppColors.textAndBackgroundColorButton,
          onTap: () {},
          width: double.infinity,
          height: 30.0.h,
        ),
      ],
    );
  }
}
