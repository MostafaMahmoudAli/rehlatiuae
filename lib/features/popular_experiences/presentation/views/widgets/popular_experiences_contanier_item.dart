import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/icon_button_with_white_background.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

import '../../../../all_trips/data/models/trips_model.dart';

class PopularExperiencesContainerItem extends StatefulWidget {
  const PopularExperiencesContainerItem({
    super.key,
    required this.width,
    this.oldTripPrice,
    this.percentageSave,
    required this.popularExperiences,
    this.isFavorite = false,
  });

  final double width;
  final String? oldTripPrice;
  final String? percentageSave;
  final Trips? popularExperiences;
  final bool? isFavorite;

  @override
  State<PopularExperiencesContainerItem> createState() => _PopularExperiencesContainerItemState();
}

class _PopularExperiencesContainerItemState extends State<PopularExperiencesContainerItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutesString.travelDetailsScreen, extra: widget.popularExperiences);
      },
      child: SizedBox(
        height: 180.0.h,
        width: widget.width,
        child: Stack(
          children: [
            Container(
              height: 180.0.h,
              width: widget.width,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    widget.popularExperiences?.imagePath ?? "",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if ((widget.oldTripPrice != null || widget.percentageSave != null) &&
                (widget.percentageSave!.isNotEmpty || widget.oldTripPrice!.isNotEmpty))
              Positioned(
                top: 16,
                left: 6,
                child: Row(
                  children: [
                    Text(
                      "\$${widget.oldTripPrice}",
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    Container(
                      width: 60.0.w,
                      height: 20.0.h,
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 4.0.w),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 4.0.w,
                        vertical: 1.3.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Text(
                        " save ${widget.percentageSave}% ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButtonWithWhiteBackground(
                onPressed: () async {
                  if (context.read<MainCubit>().client == null) {
                    context.push(AppRoutesString.loginScreen);
                    return;
                  }
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  await context.read<MainCubit>().addToFavourite(tripId: widget.popularExperiences!.id ?? 0);
                },
                width: 30.0.w,
                height: 35.0.h,
                icon: Icon(
                  isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  color: AppColors.redAppColor,
                  size: 17.0.sp,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.0.w,
                    child: Text(
                      widget.popularExperiences?.name ?? "",
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: AppColors.textAndBackgroundColorButton,
                        size: 14.0.sp,
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: 120.0.w,
                        child: Text(
                          widget.popularExperiences?.address ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.textAndBackgroundColorButton),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.075,
              right: MediaQuery.sizeOf(context).width * 0.02,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.popularExperiences?.adultPrice.toString() ?? "",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    "/Person",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
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
