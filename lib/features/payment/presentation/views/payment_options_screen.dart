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
              controller: TextEditingController(),
              readOnly: true,
              onTap: () async {
                var duration = const Duration();
                context.read<TripCheckoutDetailsCubit>().date = await Pickers.choseDate(
                  context: context,
                  firstDate: DateTime.now().add(duration),
                  initialDate: DateTime.now().add(duration),
                );
              },
              suffix: const Icon(CupertinoIcons.calendar),
            ),
            CountTicketsSection(
              onAdultsCountChange: (value) {
                context.read<TripCheckoutDetailsCubit>().adultsCount = value;
              },
              onChildrenCountChange: (value) {
                context.read<TripCheckoutDetailsCubit>().childrenCount = value;
              },
            ),
            BlocProvider<CheckCouponCubit>(
              create: (context) => getIt<CheckCouponCubit>(),
              child: CustomExpansionTile(
                title: AppStrings.youHaveCoupon,
                content: AppStrings.yourCoupon,
                initiallyExpanded: false,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          controller: context.read<TripCheckoutDetailsCubit>().couponEditingController,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          textColor: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      DefaultTextButton(
                        onPressed: () {},
                        text: 'Apply',
                      ),
                    ],
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
            TotalPaymentSection(
              total: "\$6,699",
              subtitle: "12/12/2024",
              buttonLabel: AppStrings.nextPayment,
              onButtonTap: () {
                context.push('/paymentDetailsScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
