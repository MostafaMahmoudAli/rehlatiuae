import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/check_coupon_cubit/check_coupon_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/count_tickets_section.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/field_date_booking.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/total_payment_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TripCheckoutDetailsCubit>();
    cubit.initCheckoutDetails();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Payment_Options.tr(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: cubit.dateOptionScreenFormKey,
          child: Column(
            children: [
              if (cubit.isTripSelected)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Trip Ticket",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    FieldDateBooking(
                      controller: cubit.dateEditingController,
                    ),
                    CountTicketsSection(
                      adultCost: cubit.selectedTrip!.adultPrice!.toDouble(),
                      childCost: cubit.selectedTrip!.childPrice!.toDouble(),
                      onAdultsCountChange: (count, total) {
                        cubit.onAdultsCountChange(
                          index: 0,
                          count: count,
                          total: total,
                        );
                      },
                      onChildrenCountChange: (count, total) {
                        cubit.onChildrenCountChange(
                          index: 0,
                          count: count,
                          total: total,
                        );
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
                  ],
                ),
              if (cubit.selectedOffers.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Offers Tickets",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              if (cubit.selectedOffers.isNotEmpty)
                ...List.generate(
                  cubit.selectedOffers.length,
                  (index) => Column(
                    children: [
                      FieldDateBooking(
                        controller: cubit.dateOffersEditingControllers[index],
                      ),
                      CountTicketsSection(
                        adultCost: cubit.selectedOffers[index].adultPrice!.toDouble(),
                        childCost: cubit.selectedOffers[index].childPrice!.toDouble(),
                        onAdultsCountChange: (count, total) {
                          cubit.onAdultsCountChange(
                            index: index + 1,
                            count: count,
                            total: total,
                          );
                        },
                        onChildrenCountChange: (count, total) {
                          cubit.onChildrenCountChange(
                            index: index + 1,
                            count: count,
                            total: total,
                          );
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
                    ],
                  ),
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
                                cubit.applyCoupon();
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
                subtitle: cubit.tripCheckoutDetails!.date,
                buttonLabel: 'Next',
                onButtonTap: () {
                  cubit.addDatesAndDescription(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
