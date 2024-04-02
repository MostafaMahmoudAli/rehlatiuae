import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/icon_button_with_white_background.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

import '../../../../best_offers/data/models/best_offers_model.dart';

class BestOffersItem extends StatefulWidget {
  const BestOffersItem({
    super.key,
    required this.width,
    required this.bestOffers,
    this.review,
    this.isFavorite = false,
  });

  final double width;
  final BestOffers? bestOffers;
  final int? review;
  final bool? isFavorite;

  @override
  State<BestOffersItem> createState() => _BestOffersItemState();
}

class _BestOffersItemState extends State<BestOffersItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: widget.width,
            child: Stack(
              children: [
                Container(
                  height: 140.0.h,
                  width: widget.width,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0.r),
                  ),
                  child: Image.network(
                    widget.bestOffers?.imagePath ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: IconButtonWithWhiteBackground(
                    onPressed: () async {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      await context.read<MainCubit>().addToFavourite(tripId: widget.bestOffers!.id);
                    },
                    width: 25.0.w,
                    height: 30.0.h,
                    icon: Icon(
                      isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
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
                  widget.bestOffers?.name ?? "IMG Worlds of Adventure",
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
                    Expanded(
                      child: Text(
                        widget.bestOffers?.address ?? "Dubai, United Arab Emirates",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.w,
                ),
                Text(
                  widget.bestOffers?.description ?? "This exceptional beach gets ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 5.0.w,
                ),
                if ((widget.bestOffers?.beforePrice != null || widget.bestOffers?.saving != null))
                  Row(
                    children: [
                      Text(
                        "\$${widget.bestOffers?.beforePrice}",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.black,
                            ),
                      ),
                      Container(
                        width: 65.0.w,
                        height: 20.0.h,
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 6.0.w, vertical: 1.3.h),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        child: Text(
                          " Save ${widget.bestOffers?.saving}%",
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
                      "\$${widget.bestOffers?.adultPrice.toString()}",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Text(
                      "/Person",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.justify,
                    ),
                    const Spacer(),
                    if (widget.review != null)
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: AppColors.textAndBackgroundColorButton,
                            size: 16.0.sp,
                          ),
                          Text(
                            widget.review.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.justify,
                          ),
                        ],
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
