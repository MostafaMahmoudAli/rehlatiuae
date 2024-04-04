import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_icon_button.dart';

class BolgTravelTitleSection extends StatefulWidget {
  final String title;
  final String address;
  final String price;
  final String? saving;
  final String? beforePrice;
  final String imagePath;
  final bool isTrip;
  final bool isOffer;
  final bool? isFavorite;
  final void Function()? onLikePressed;

  const BolgTravelTitleSection({
    required this.title,
    required this.address,
    required this.price,
    required this.imagePath,
    this.saving,
    this.beforePrice,
    this.onLikePressed,
    this.isTrip = true,
    this.isOffer = false,
    this.isFavorite = false,
    super.key,
  });

  @override
  State<BolgTravelTitleSection> createState() => _BolgTravelTitleSectionState();
}

class _BolgTravelTitleSectionState extends State<BolgTravelTitleSection> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isOffer ? 300.h : 400.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    widget.imagePath,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.sp),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: widget.isOffer ? Icons.clear : Icons.arrow_back,
                  onPressed: () {
                    context.pop();
                  },
                ),
                if (widget.isTrip)
                  CustomIconButton(
                    icon: isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    iconColor: AppColors.redAppColor,
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      widget.onLikePressed?.call();
                    },
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.sp),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180.w,
                            child: Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          if (widget.isOffer || widget.isTrip)
                            Container(
                              height: 20.0.h,
                              margin: EdgeInsetsDirectional.symmetric(horizontal: 4.0.w),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(
                                      "\$${widget.beforePrice}",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: AppColors.black,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 4.0.w,
                                      vertical: 1.3.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(8.0.r),
                                    ),
                                    child: Text(
                                      "save ${widget.saving}%",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (widget.isTrip)
                            Text(
                              "\$${widget.price}",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          Text(
                            widget.isTrip ? " /Person" : '7,3 2024',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.textAndBackgroundColorButton,
                      ),
                      Text(
                        widget.address,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
