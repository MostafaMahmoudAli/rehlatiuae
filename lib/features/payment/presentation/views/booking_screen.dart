import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/order_summary_card.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/payment_content_sheet.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingCubit>()..getBooking(),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 300.h),
                child: const CircularProgressIndicator(),
              ),
            ),
            success: (bookings) => ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: bookings.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => OrderSummaryCard(
                title: bookings[index].trip?.name,
                total: '${bookings[index].total}',
                childrenCount: '${bookings[index].quantityChildren}',
                adultCount: '${bookings[index].quantityAdult}',
                address: bookings[index].trip?.address ?? '',
                imageUrl: bookings[index].trip?.imagePath ?? '',
                date: bookings[index].date ?? '',
                status: bookings[index].status,
                onTapButton: () {
                  if (bookings[index].status == 'unPaid') {
                    context.read<TripCheckoutDetailsCubit>().makePayment(
                          amount:context.read<MainCubit>().currentCurrencyPrice! * bookings[index].total!.toDouble(),
                          currency: context.read<MainCubit>().currentCurrency.name,
                        );
                  } else {
                    double totalAfterDiscount =
                        (bookings[index].subtotalAdult! + bookings[index].subtotalChildren!).toDouble();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      builder: (c) => CustomBottomSheet(
                        title: LocaleKeys.Payment_Details.tr(),
                        labelButton: bookings[index].status == 'paid' ? 'Back' : 'Payment',
                        contentSheet: PaymentContentSheet(
                          totalAfterDiscount: totalAfterDiscount,
                          allSubtotal: bookings[index].total!.toDouble(),
                          tripDate: bookings[index].date!,
                        ),
                        onButtonPreesd: () {
                          context.pop();
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
/*
                  InkWell(
                    onTap: () {
                      double totalAfterDiscount =
                          (bookings[index].subtotalAdult! + bookings[index].subtotalChildren!).toDouble();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        builder: (c) => CustomBottomSheet(
                          title: LocaleKeys.Payment_Details.tr(),
                          labelButton: bookings[index].status == 'paid' ? 'Back' : 'Payment',
                          contentSheet: PaymentContentSheet(
                            totalAfterDiscount: totalAfterDiscount,
                            allSubtotal: bookings[index].total!.toDouble(),
                            tripDate: bookings[index].date!,
                          ),
                          onButtonPreesd: () {
                            context.read<TripCheckoutDetailsCubit>().makePayment(
                                  amount: bookings[index].total!.toDouble(),
                                  currency: context.read<MainCubit>().currentCurrency.name,
                                );
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 160.w,
                            child: Text(
                              bookings[index].trip?.name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.grey,
                                  ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${bookings[index].total} \$',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                bookings[index].status ?? '',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: AppColors.grey,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

 */
