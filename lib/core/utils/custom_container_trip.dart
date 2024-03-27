import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_icon_button.dart';
class CustomContainerTrip extends StatelessWidget {
  const CustomContainerTrip({
    super.key,
    required this.width,
    required this.imageName,
    required this.cityName,
    required this.countryName,
    this.tripPrice,
    this.reservationType,
    this.oldTripPrice,
    this.percentageSave,
  });

  final double width;
  final String imageName;
  final String cityName;
  final String countryName;
  final String?tripPrice;
  final String?reservationType;
  final int?oldTripPrice;
  final String?percentageSave ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.0.h,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 185.0.h,
            width: width,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15.0.r),
            ),
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
            ),
          ),
          if((oldTripPrice!=null || percentageSave!=null)&&percentageSave!.isNotEmpty)
          Positioned(
            top: 20,
            left: 18,
            child:  Row(
              children: [
                Text(
                  oldTripPrice.toString(),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold,),
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
                    percentageSave ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 18,
            child: CustomIconButton(
              icon: Icons.favorite_outline_outlined,
              iconColor: AppColors.redAppColor,
              onPressed: () {},
              size: 35.0.w,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: AppColors.whiteAppColor,
                      size: 14.0.sp,
                    ),
                    SizedBox(
                      width: 1.0.w,
                    ),
                    Text(
                      cityName,
                      style:Theme.of(context).textTheme.displaySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if((tripPrice!=null || reservationType!=null)&&(tripPrice!.isNotEmpty&&reservationType!.isNotEmpty))
          Positioned(
            bottom: 50,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tripPrice ?? "",
                  style:Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Text(
                  reservationType ?? "",
                  style:Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
