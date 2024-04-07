import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/check_coupon_cubit/check_coupon_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/count_tickets_section.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/field_date_booking.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/total_payment_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final Trips trip;

  const PaymentOptionsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Payment_Options.tr(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.black,
              ),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<TripCheckoutDetailsCubit>(),
        child: BlocBuilder<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
          builder: (context, state) {
            var cubit = context.read<TripCheckoutDetailsCubit>();
            cubit.initTripCheckoutDetails(trip);
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FieldDateBooking(cubit: cubit),
                  CountTicketsSection(
                    title: "Select Trip Ticket",
                    adultCost: trip.adultPrice!.toDouble(),
                    childCost: trip.childPrice!.toDouble(),
                    onAdultsCountChange: (count, total) {
                      cubit.tripCheckoutDetails = cubit.tripCheckoutDetails!.copyWith(
                        quantityAdult: count,
                        subtotalAdult: total,
                        finalSubtotal: total + cubit.tripCheckoutDetails!.subtotalChild,
                      );
                      cubit.changeChangeDetails();
                    },
                    onChildrenCountChange: (count, total) {
                      cubit.tripCheckoutDetails = cubit.tripCheckoutDetails!.copyWith(
                        quantityChild: count,
                        subtotalChild: total,
                        finalSubtotal: total + cubit.tripCheckoutDetails!.subtotalAdult,
                      );
                      cubit.changeChangeDetails();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: DottedLine(
                      dashLength: 8.w,
                      alignment: WrapAlignment.spaceBetween,
                      dashColor: AppColors.grey,
                    ),
                  ),
                  CountTicketsSection(
                    title: "Select offer Ticket",
                    adultCost: trip.adultPrice!.toDouble(),
                    childCost: trip.childPrice!.toDouble(),
                    onAdultsCountChange: (count, total) {
                      cubit.tripCheckoutDetails = cubit.tripCheckoutDetails!.copyWith(
                        quantityAdult: count,
                        subtotalAdult: total,
                        finalSubtotal: total + cubit.tripCheckoutDetails!.subtotalChild,
                      );
                      cubit.changeChangeDetails();
                    },
                    onChildrenCountChange: (count, total) {
                      cubit.tripCheckoutDetails = cubit.tripCheckoutDetails!.copyWith(
                        quantityChild: count,
                        subtotalChild: total,
                        finalSubtotal: total + cubit.tripCheckoutDetails!.subtotalAdult,
                      );
                      cubit.changeChangeDetails();
                    },
                  ),
                  BlocProvider<CheckCouponCubit>(
                    create: (context) => getIt<CheckCouponCubit>(),
                    child: CustomExpansionTile(
                      title: LocaleKeys.You_Have_Coupon.tr(),
                      content: LocaleKeys.Your_Coupon.tr(),
                      initiallyExpanded: false,
                      children: [
                        BlocBuilder<CheckCouponCubit, CheckCouponState>(
                          builder: (c, state) {
                            var cubitCoupon = c.read<CheckCouponCubit>();
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: PrimaryTextField(
                                        controller: cubitCoupon.couponEditingController,
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        textColor: AppColors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    state.maybeWhen(
                                      loading: () => Center(
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          margin: const EdgeInsets.all(15),
                                          child: const CircularProgressIndicator(
                                            color: AppColors.textAndBackgroundColorButton,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      orElse: () => DefaultTextButton(
                                        onPressed: () async {
                                          await cubitCoupon.checkCoupon();
                                        },
                                        text: 'Apply',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                state.maybeWhen(
                                  success: (coupon) {
                                    cubit.coupon = coupon;
                                    return Text(
                                      "Discount is ${coupon.couponAmount}%",
                                      style: Theme.of(c).textTheme.bodyLarge!.copyWith(
                                            color: AppColors.textAndBackgroundColorButton,
                                          ),
                                    );
                                  },
                                  orElse: () => const SizedBox(),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  PrimaryTextField(
                    label: LocaleKeys.Description.tr(),
                    hint: LocaleKeys.insert_notes.tr(),
                    isTextAria: true,
                    controller: cubit.descriptionEditingController,
                  ),
                  TotalPaymentSection(
                    total: "\$${cubit.allSubtotal}",
                    subtitle: cubit.tripCheckoutDetails!.date,
                    buttonLabel: LocaleKeys.Next_payment.tr(),
                    onButtonTap: () {
                      if (!cubit.dateFormKey.currentState!.validate()) return;
                      cubit.applyTripDetails(tripId: trip.id ?? 0);
                      context.push(AppRoutesString.paymentDetailsScreen);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
