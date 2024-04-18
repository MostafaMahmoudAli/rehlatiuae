import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

class TotalPaymentSection extends StatelessWidget {
  final String buttonLabel;
  final void Function() onButtonTap;

  const TotalPaymentSection({
    required this.buttonLabel,
    required this.onButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      color: AppColors.backgroundWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<TripCheckoutDetailsCubit, TripCheckoutDetailsState>(
                builder: (context, state) {
                  var cubit = context.read<TripCheckoutDetailsCubit>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (cubit.allSubtotal != cubit.totalAfterDiscount)
                        Text(
                          "\$${cubit.allSubtotal.toStringAsFixed(1)} ${context.read<MainCubit>().currentCurrency.name.toUpperCase()}",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      Text(
                        "${(cubit.totalAfterDiscount).toStringAsFixed(1)} ${context.read<MainCubit>().currentCurrency.name.toUpperCase()}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          CustomActionButton(
            text: buttonLabel,
            borderRadius: BorderRadius.circular(16.sp),
            backGroundColor: AppColors.textAndBackgroundColorButton,
            onTap: onButtonTap,
            width: 100.w,
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
