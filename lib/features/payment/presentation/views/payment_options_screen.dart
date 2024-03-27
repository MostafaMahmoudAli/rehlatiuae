import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/check_coupon_cubit/check_coupon_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/count_tickets_section.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryTextField(
              label: AppStrings.yourDateBooking,
              hint: AppStrings.selectDate,
              controller: context.read<TripCheckoutDetailsCubit>().dateEditingController,
              readOnly: true,
              onTap: () async {
                var cubit = context.read<TripCheckoutDetailsCubit>();
                cubit.dateEditingController.text = await Pickers.choseDate(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                    ) ??
                    '';
                if (context.mounted) {
                  cubit.changeChangeDetails();
                  print('object');
                }
              },
              suffix: const Icon(CupertinoIcons.calendar),
            ),
            CountTicketsSection(
              adultCost: 130,
              childCost: 60,
              onAdultsCountChange: (count, total) {
                var cubit = context.read<TripCheckoutDetailsCubit>();
                cubit.adultsCount = count;
                cubit.subtotalAdult = total;
                cubit.changeChangeDetails();
              },
              onChildrenCountChange: (count, total) {
                var cubit = context.read<TripCheckoutDetailsCubit>();
                cubit.childrenCount = count;
                cubit.subtotalChild = total;
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
                    builder: (context, state) {
                      var cubit = context.read<CheckCouponCubit>();
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryTextField(
                                  controller: cubit.couponEditingController,
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
                                    await cubit.checkCoupon();
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
                            success: (coupon) => Text(
                              "Discount is ${coupon.couponAmount}%",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.textAndBackgroundColorButton,
                                  ),
                            ),
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
              controller: context.read<TripCheckoutDetailsCubit>().descriptionEditingController,
            ),
            BlocBuilder<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
              builder: (context, state) {
                return TotalPaymentSection(
                  total: "\$${context.read<TripCheckoutDetailsCubit>().allSubtotal}",
                  subtitle: context.read<TripCheckoutDetailsCubit>().dateEditingController.text,
                  buttonLabel: AppStrings.nextPayment,
                  onButtonTap: () {
                    context.push('/paymentDetailsScreen');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
