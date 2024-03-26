import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/icon_button_with_white_background.dart';

class BestOffersItem extends StatelessWidget {
  const BestOffersItem({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0.h,
      width: 150.0.w,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 8.0.w,
        vertical: 10.0.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteAppColor,
        borderRadius: BorderRadiusDirectional.circular(12.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100.0.h,
            width: width,
            child: Stack(
              children: [
                Container(
                  height: 100.0.h,
                  width: width,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0.r),
                  ),
                  child: Image.asset(
                    "assets/images/Rectangle 427.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: IconButtonWithWhiteBackground(
                    onPressed: () {},
                    width: 25.0.w,
                    height: 30.0.h,
                    icon: Icon(
                      Icons.favorite_outline,
                      color: AppColors.redAppColor,
                      size: 14.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.5.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "IMG Worlds of Adventure",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 2.5.w,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: AppColors.textAndBackgroundColorButton,
                      size: 14.0.sp,
                    ),
                    Text(
                      "Dubai, United Arab Emirates",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.w,
                ),
                Text(
                  "This exceptional beach gets sasafadvd avdsdsfcasvsdvsdvsdvsd",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 5.0.w,
                ),
                Row(
                  children: [
                    Text(
                      "100",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Container(
                      width:65.0.w,
                      height:20.0.h,
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                      padding: EdgeInsetsDirectional.symmetric(horizontal:6.0.w,vertical: 1.3.h),
                      decoration:BoxDecoration(
                        color:AppColors.green,
                        borderRadius:BorderRadius.circular(8.0.r),
                      ),
                      child: Text(
                        "Save 45 %",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0.w,
                ),
                Row(
                  children: [
                    Text(
                      "48",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(width: 5.0.w,),
                    Text(
                      "/Person",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.justify,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star_border_outlined,
                      color: AppColors.textAndBackgroundColorButton,
                      size: 16.0.sp,
                    ),
                    Text(
                      "4.2 (852)",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
