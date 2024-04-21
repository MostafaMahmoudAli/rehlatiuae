import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PaymentContentSheet extends StatelessWidget {
  final double totalAfterDiscount;
  final double allSubtotal;
  final String? paymentId;
  final String tripDate;

  const PaymentContentSheet({
    required this.totalAfterDiscount,
    required this.allSubtotal,
    required this.tripDate,
    this.paymentId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.Total_Amount.tr(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.grayLight,
              ),
        ),
        Text(
          "\$ ${(totalAfterDiscount * context.read<MainCubit>().currentCurrencyPrice).toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
              ),
        ),
        RowDetails(
          title: "Payment Date",
          value: Pickers.formatDate(DateTime.now()),
        ),
        RowDetails(
          title: "Trip Date",
          value: tripDate,
        ),
        if (paymentId != null)
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Payment Id',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                paymentId!,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        SizedBox(
          height: 20.h,
        ),
        DottedLine(
          dashLength: 8.w,
          alignment: WrapAlignment.spaceBetween,
          dashColor: AppColors.grey,
        ),
        RowDetails(
          title: "Total Payment",
          value: "\$${(allSubtotal * context.read<MainCubit>().currentCurrencyPrice).toStringAsFixed(2)}",
        ),
        RowDetails(
          title: "Discount",
          value:
              "\$${((allSubtotal - totalAfterDiscount) * context.read<MainCubit>().currentCurrencyPrice).toStringAsFixed(2)}",
        ),
        RowDetails(
          title: "Total",
          value: "\$${(totalAfterDiscount * context.read<MainCubit>().currentCurrencyPrice).toStringAsFixed(2)}",
          textValueColor: AppColors.textAndBackgroundColorButton,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
