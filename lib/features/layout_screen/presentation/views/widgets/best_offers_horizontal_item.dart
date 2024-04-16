import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/icon_button_with_white_background.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

import '../../../../../core/routes/app_routes_strings.dart';
import '../../../../all_trips/data/models/trips_model.dart';
import '../../cubits/main_cubit/main_cubit.dart';

class BestOffersHorizontalItem extends StatefulWidget {
  const BestOffersHorizontalItem({
    super.key,
    required this.width,
    required this.offer,
    required this.review,
    this.isFavorite = false,
  });

  final Trips? offer;
  final double? review;
  final double width;
  final bool? isFavorite;

  @override
  State<BestOffersHorizontalItem> createState() => _BestOffersHorizontalItemState();
}

class _BestOffersHorizontalItemState extends State<BestOffersHorizontalItem> {
  bool isFavorite = false;
  Trips? trip;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
    trip = widget.offer;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('isFavourite: ${trip?.isFavourite}');
        context.push(AppRoutesString.travelDetailsScreen, extra: trip).then((value) {
          context.read<TripCheckoutDetailsCubit>().onCloseTripDetailsScreen();
        });
      },
      child: Container(
        width: 220.0.w,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 8.0.w,
          vertical: 10.0.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.orange,
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
                    height: 150.0.h,
                    width: widget.width,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0.r),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.offer?.imagePath ?? "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.01,
                    right: MediaQuery.sizeOf(context).width * 0.02,
                    child: IconButtonWithWhiteBackground(
                      onPressed: () async {
                        if (context.read<MainCubit>().client == null) {
                          context.push(AppRoutesString.loginScreen);
                          return;
                        }
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        trip = trip!.copyWith(
                          isFavourite: isFavorite,
                        );
                        print('isFavourite: ${trip?.isFavourite}');
                        await context.read<MainCubit>().addToFavourite(tripId: widget.offer!.id ?? 0);
                      },
                      width: 22.0.w,
                      height: 26.0.h,
                      icon: Icon(
                        isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        color: AppColors.redAppColor,
                        size: 9.0.sp,
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
                    widget.offer?.name ?? "",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.5.w,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: AppColors.whiteAppColor,
                        size: 14.0.sp,
                      ),
                      SizedBox(
                        width: 100.0.w,
                        child: Text(
                          widget.offer?.address ?? "",
                          style: Theme.of(context).textTheme.displaySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.w,
                  ),
                  Text(
                    widget.offer?.description ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 5.0.w,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${widget.offer?.adultPrice.toString() ?? ""}",
                        style: Theme.of(context).textTheme.displaySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      Text(
                        "/Person",
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star_border_outlined,
                        color: AppColors.whiteAppColor,
                        size: 16.0.sp,
                      ),
                      Text(
                        widget.review.toString().characters.first,
                        style: Theme.of(context).textTheme.displaySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0.w,
                  ),
                  if (widget.offer?.beforePrice != null)
                    Row(
                      children: [
                        Text(
                          "\$${widget.offer?.beforePrice}",
                          style: Theme.of(context).textTheme.headlineMedium,
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
                            "Save ${widget.offer?.saving}% ",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
