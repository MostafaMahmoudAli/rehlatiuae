import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/check_coupon_cubit/check_coupon_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/count_tickets_section.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/field_date_booking.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/total_payment_section.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.paymentOptions,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.black,
              ),
        ),
      ),
      body: BlocBuilder<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
        builder: (context, state) {
          var cubit = context.read<TripCheckoutDetailsCubit>();
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldDateBooking(cubit: cubit),
                CountTicketsSection(
                  adultCost: cubit.adultCost,
                  childCost: cubit.childCost,
                  onAdultsCountChange: (count, total) {
                    cubit.tripCheckoutDetails = cubit.tripCheckoutDetails.copyWith(
                      quantityAdult: count,
                      subtotalAdult: total,
                      total: total + cubit.tripCheckoutDetails.subtotalChild,
                    );
                    cubit.changeChangeDetails();
                  },
                  onChildrenCountChange: (count, total) {
                    cubit.tripCheckoutDetails = cubit.tripCheckoutDetails.copyWith(
                      quantityChild: count,
                      subtotalChild: total,
                      total: total + cubit.tripCheckoutDetails.subtotalAdult,
                    );
                    cubit.changeChangeDetails();
                  },
                ),
                BlocProvider<CheckCouponCubit>(
                  create: (context) => getIt<CheckCouponCubit>(),
                  child: CustomExpansionTile(
                    title: AppStrings.youHaveCoupon,
                    content: AppStrings.yourCoupon,
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
                  label: AppStrings.description,
                  hint: AppStrings.pleaseInsertAllNotes,
                  isTextAria: true,
                  controller: cubit.descriptionEditingController,
                ),
                TotalPaymentSection(
                  total: "\$${cubit.allSubtotal}",
                  subtitle: cubit.tripCheckoutDetails.date,
                  buttonLabel: AppStrings.nextPayment,
                  onButtonTap: () {
                    if (!cubit.dateFormKey.currentState!.validate()) return;
                    context.push(AppStrings.paymentDetailsScreen);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
