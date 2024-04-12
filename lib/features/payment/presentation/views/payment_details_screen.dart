import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/order_summary_card.dart';
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
      body: BlocConsumer<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
        listener: (context, state) {
          var cubit = context.read<TripCheckoutDetailsCubit>();
          state.whenOrNull(
            checkedTripError: (message) {
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
            stripeError: (message) {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: message,
                  subtitle: 'Sorry',
                  labelText: 'Close',
                  color: AppColors.redAppColor,
                ),
              );
            },
            checkedTripSuccess: (checkTripsAndOffersResponse) async {
              await cubit.makePayment(currency: context.read<MainCubit>().currentCurrency.name);
            },
            stripeSuccess: () async {
              await cubit.succeedCheckoutTrip();
            },
            success: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                builder: (c) => PopScope(
                  canPop: false,
                  child: CustomBottomSheet(
                    title: LocaleKeys.Payment_Details.tr(),
                    hasBackButton: false,
                    labelButton: 'Back to Homepage',
                    contentSheet: PaymentContentSheet(
                      totalAfterDiscount: cubit.totalAfterDiscount,
                      allSubtotal: cubit.allSubtotal,
                      tripDate: cubit.dateEditingController.text,
                      paymentId: cubit.sessionId,
                    ),
                    onButtonPreesd: () async {
                      context.go(AppRoutesString.homeScreen);
                    },
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          var cubit = context.read<TripCheckoutDetailsCubit>();
          return state.maybeWhen(
            checkedTripLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            stripeLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () => Stack(
              children: [
                ListView(
                  children: [
                    if (cubit.isTripSelected)
                      OrderSummaryCard(
                        total:
                            '${cubit.selectedData[0].quantityOld! * cubit.selectedTrip!.adultPrice! + cubit.selectedData[0].quantityYoung! * cubit.selectedTrip!.childPrice!}',
                        childrenCount: '${cubit.selectedData[0].quantityYoung}',
                        adultCount: '${cubit.selectedData[0].quantityOld}',
                        address: cubit.selectedTrip!.address ?? '',
                        imageUrl: cubit.selectedTrip!.imagePath!,
                        date: cubit.dateEditingController.text,
                      ),
                    if (cubit.selectedOffers.isNotEmpty)
                      ...List.generate(
                        cubit.selectedOffers.length,
                        (index) {
                          int increment = cubit.isTripSelected ? 1 : 0;
                          int total = cubit.selectedData[index + increment].quantityOld! *
                                  cubit.selectedOffers[index].adultPrice! +
                              cubit.selectedData[index + increment].quantityYoung! *
                                  cubit.selectedOffers[index].childPrice!;
                          return OrderSummaryCard(
                            total: '$total',
                            childrenCount: '${cubit.selectedData[index + increment].quantityYoung}',
                            adultCount: '${cubit.selectedData[index + increment].quantityOld}',
                            address: cubit.selectedOffers[index].address ?? cubit.selectedTrip!.address!,
                            imageUrl: cubit.selectedOffers[index].imagePath!,
                            date: cubit.dateOffersEditingControllers[index].text,
                          );
                        },
                      ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: TotalPaymentSection(
                    buttonLabel: LocaleKeys.Payment.tr(),
                    onButtonTap: () async {
                      cubit.checkoutTripsAndOffers();
                      // await cubit.paymentMethod(currency: context.read<MainCubit>().currentCurrency.name);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
