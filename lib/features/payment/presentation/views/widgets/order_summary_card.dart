import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class OrderSummaryCard extends StatelessWidget {
  final String? title;
  final String total;
  final String childrenCount;
  final String adultCount;
  final String address;
  final String imageUrl;
  final String date;
  final String? status;
  final void Function()? onTapButton;

  const OrderSummaryCard({
    this.title,
    required this.total,
    required this.childrenCount,
    required this.adultCount,
    required this.address,
    required this.imageUrl,
    required this.date,
    this.status,
    this.onTapButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.h,
          color: AppColors.black.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 85.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              SizedBox(
                width: 16.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title != null ? title! : LocaleKeys.Order_Summary.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${LocaleKeys.Adult.tr()}: $adultCount",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          "${LocaleKeys.Children.tr()}: $childrenCount",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.placemark,
                size: 20.h,
              ),
              Text(
                address,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.Total_Amount.tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                total.substring(0,6),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          if (status != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      LocaleKeys.Status.tr(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      status!.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                CustomActionButton(
                  text: status == 'unPaid' ? LocaleKeys.Payment.tr() : LocaleKeys.view.tr(),
                  borderRadius: BorderRadius.circular(10.sp),
                  backGroundColor: AppColors.textAndBackgroundColorButton,
                  onTap: onTapButton,
                  width: 80.w,
                  height: 40.h,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
