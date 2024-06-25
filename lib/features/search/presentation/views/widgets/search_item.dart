import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/icon_button_with_white_background.dart';
import '../../../data/search_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.width,
    required this.searchTrip,
  });

  final double width;
  final SearchModel?searchTrip;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0.h,
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
            height: 120.0.h,
            width: width,
            child: Stack(
              children: [
                Container(
                  height: 100.0.h,
                  width: width,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0.r),
                    image: DecorationImage(
                      fit:BoxFit.cover,
                      image:CachedNetworkImageProvider(
                        searchTrip?.imagePath ?? "",
                      ),
                    ),
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
                  searchTrip?.name ??  "",
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
                      searchTrip?.address ??  "",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.w,
                ),
                Text(
                  searchTrip?.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 5.0.w,
                ),
                if((searchTrip?.beforePrice!=null|| searchTrip?.saving!=null))
                  Row(
                    children: [
                      Text(
                        searchTrip?.beforePrice ?? "",
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
                          searchTrip?.saving ??  "",
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
                      searchTrip?.adultPrice.toString() ?? "",
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