import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/field_date_booking.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/order_summary_section.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/payment_content_sheet.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/total_payment_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Payment_Details.tr(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.black,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FieldDateBooking(
                cubit: context.read<TripCheckoutDetailsCubit>(),
                isFirstScreen: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              OrderSummarySection(
                total: '${context.read<TripCheckoutDetailsCubit>().tripCheckoutDetails.finalSubtotal}',
                childrenCount: '${context.read<TripCheckoutDetailsCubit>().tripCheckoutDetails.quantityChild}',
                adultCount: '${context.read<TripCheckoutDetailsCubit>().tripCheckoutDetails.quantityAdult}',
                address: LocaleKeys.Dubai_United.tr(),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: TotalPaymentSection(
              total: "\$${context.read<TripCheckoutDetailsCubit>().allSubtotal}",
              subtitle: LocaleKeys.View_detailed_bill.tr(),
              buttonLabel: LocaleKeys.Payment.tr(),
              onButtonTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  builder: (context) => BlocConsumer<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        error: (message) {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              title: message,
                              subtitle: LocaleKeys.Sorry.tr(),
                              labelText: LocaleKeys.Close.tr(),
                              color: AppColors.redAppColor,
                            ),
                          );
                        },
                        success: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => CustomDialog(
                              title: 'Payment Success',
                              subtitle: '${context.read<TripCheckoutDetailsCubit>().allSubtotal}',
                              labelText: 'Back to Homepage',
                              onTap: () {
                                context.go(AppRoutesString.homeScreen);
                              },
                            ),
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      var cubit = context.read<TripCheckoutDetailsCubit>();
                      return state.maybeWhen(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        orElse: () => CustomBottomSheet(
                          title: LocaleKeys.Payment_Details.tr(),
                          labelButton: LocaleKeys.Payment.tr(),
                          contentSheet: PaymentContentSheet(
                            tripCheckoutDetails: cubit.tripCheckoutDetails,
                          ),
                          onButtonPreesd: () async {
                            cubit.addTripCheckoutDetails();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              onSubtitleTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  builder: (context) => CustomBottomSheet(
                    title: LocaleKeys.Payment_Details.tr(),
                    labelButton: LocaleKeys.Payment.tr(),
                    contentSheet: PaymentContentSheet(
                      tripCheckoutDetails: context.read<TripCheckoutDetailsCubit>().tripCheckoutDetails,
                    ),
                    avatarColor: AppColors.backgroundAvatarPayment,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
