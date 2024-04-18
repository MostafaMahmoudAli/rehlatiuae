import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/offer_details_screen.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class OfferCard extends StatefulWidget {
  final Trips offer;
  final Trips trip;
  final bool isTripSelected;

  const OfferCard({
    required this.offer,
    required this.trip,
    required this.isTripSelected,
    super.key,
  });

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isTripSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.black.withOpacity(0.6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: SizedBox(
              width: 190.w,
              child: Text(
                widget.offer.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20.0.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${(context.read<MainCubit>().currentCurrencyPrice! *  int.parse(widget.offer.beforePrice ?? "") ).toStringAsFixed(1)} ${context.read<MainCubit>().currentCurrency.name.toUpperCase()}",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.black,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          SizedBox(
                            width: 5.w,
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
                              "save ${widget.offer.saving}%",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${(context.read<MainCubit>().currentCurrencyPrice! * widget.offer.adultPrice!.toInt()).toStringAsFixed(1)} ${context.read<MainCubit>().currentCurrency.name.toUpperCase()}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Text(
                          ' /Person',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w)
                    .copyWith(bottom: 30.h),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: AppColors.textAndBackgroundColorButton,
                    ),
                    Text(
                      widget.offer.address ?? widget.trip.address ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              CustomActionButton(
                text: isSelected
                    ? LocaleKeys.selected.tr()
                    : LocaleKeys.select.tr(),
                borderRadius: BorderRadius.circular(15.sp),
                backGroundColor: isSelected
                    ? AppColors.green
                    : AppColors.textAndBackgroundColorButton,
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  if (widget.isTripSelected) {
                    context.read<TripCheckoutDetailsCubit>().isTripSelected =
                        isSelected;
                    return;
                  }
                  if (isSelected) {
                    context
                        .read<TripCheckoutDetailsCubit>()
                        .selectedOffers
                        .add(widget.offer);
                  } else {
                    context
                        .read<TripCheckoutDetailsCubit>()
                        .selectedOffers
                        .remove(widget.offer);
                  }
                },
                width: 195.w,
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: SizedBox(
                  width: 190.w,
                  child: Text(
                    widget.offer.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                ),
              ),
              DefaultTextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    builder: (context) => OfferDetailsScreen(
                      offer: widget.offer,
                      trip: widget.trip,
                      isTripSelected: widget.isTripSelected,
                    ),
                  );
                },
                text: LocaleKeys.View_Details.tr(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.grayLight, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
