import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/currency.dart';
import 'package:easy_localization/easy_localization.dart' as s;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_icon_button.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

import '../../generated/locale_keys.g.dart';

class CustomContainerTrip extends StatefulWidget {
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
    this.isFavorite = false,
    this.isTrip = true,
    this.trip,
    this.onTapFavoriteIcon,
  });

  final double width;
  final Trips? trip;
  final String? imageName;
  final String? cityName;
  final String? countryName;
  final int? tripPrice;
  final String? reservationType;
  final String? oldTripPrice;
  final String? percentageSave;
  final bool? isFavorite;
  final bool isTrip;
  final void Function()? onTapFavoriteIcon;

  @override
  State<CustomContainerTrip> createState() => _CustomContainerTripState();
}

class _CustomContainerTripState extends State<CustomContainerTrip> {
  bool isFavorite = false;
  Trips? trip;
  String englishKey = LocaleKeys.English.tr();
  late bool isEnglish = (englishKey == 'English');

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
    trip = widget.trip;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isTrip
          ? () {
              context.push(AppRoutesString.travelDetailsScreen, extra: trip).then(
                (value) {
                  trip = trip!.copyWith(
                    isFavourite: value as bool,
                  );
                  isFavorite = value;
                  context.read<TripCheckoutDetailsCubit>().onCloseTripDetailsScreen();
                },
              );
            }
          : null,
      child: SizedBox(
        height: 185.0.h,
        width: widget.width,
        child: Stack(
          children: [
            Container(
              height: 185.0.h,
              width: widget.width,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    widget.imageName ?? "",
                  ),
                ),
              ),
            ),
            if ((widget.oldTripPrice != null || widget.percentageSave != null) && widget.percentageSave!.isNotEmpty)
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.02,
                left: MediaQuery.sizeOf(context).width * 0.02,
                child: Row(
                  children: [
                    Text(
                      context.read<MainCubit>().currentCurrency == Currency.usd ?
                      "\$${widget.oldTripPrice.toString()}" :
                      (context.read<MainCubit>().currentCurrencyPrice! * int.parse(widget.oldTripPrice??"") ).toStringAsFixed(1),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Container(
                      width: 58.0.w,
                      height: 20.0.h,
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 2.0.w),
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 6.0.w, vertical: 1.3.h),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Text(
                        "save ${widget.percentageSave}%",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0.sp),
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.isTrip)
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.01,
                right: MediaQuery.sizeOf(context).width * 0.02,
                child: CustomIconButton(
                  icon: isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  iconColor: AppColors.redAppColor,
                  onPressed: () async {
                    if (context.read<MainCubit>().client == null) {
                      context.push(AppRoutesString.loginScreen);
                      return;
                    }
                    if (widget.onTapFavoriteIcon != null) {
                      widget.onTapFavoriteIcon?.call();
                      return;
                    }
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    trip = trip!.copyWith(
                      isFavourite: isFavorite,
                    );
                    context.read<MainCubit>().addToFavourite(tripId: trip!.id ?? 0);
                  },
                  size: 35.0.w,
                ),
              ),
            Positioned.directional(
              textDirection: isEnglish ?TextDirection.ltr : TextDirection.rtl ,
              bottom: MediaQuery.sizeOf(context).height * 0.037,
              start: MediaQuery.sizeOf(context).width * 0.02,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width : 130.0.w,
                    child: Text(
                    widget.cityName ?? "",
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
                        width: 1.0.w,
                      ),
                      SizedBox(
                        width: 100.0.w,
                        child: Text(
                          widget.countryName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: AppColors.textAndBackgroundColorButton),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if ((widget.tripPrice != null || widget.reservationType != null) &&
                (widget.tripPrice!.toString().isNotEmpty && widget.reservationType!.isNotEmpty))
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.1,
                right: MediaQuery.sizeOf(context).width * 0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${(context.read<MainCubit>().currentCurrencyPrice! * widget.trip!.adultPrice!.toInt()).toStringAsFixed(1)} ${context.read<MainCubit>().currentCurrency.name.toUpperCase()}",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Text(
                      widget.reservationType ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
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
