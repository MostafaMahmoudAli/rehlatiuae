import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

class PaymentContentSheet extends StatelessWidget {
  final String? referenceNum;

  const PaymentContentSheet({
    this.referenceNum,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TripCheckoutDetailsCubit>();
    return Column(
      children: [
        Text(
          "Total Amount",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.grayLight,
              ),
        ),
        Text(
          "\$ ${cubit.totalAfterDiscount.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
              ),
        ),
        RowDetails(
          title: "Payment Date",
          value: Pickers.formatDate(DateTime.now()),
        ),
        if (referenceNum != null)
          RowDetails(
            title: "Reference num",
            value: referenceNum!,
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
          value: "\$${cubit.allSubtotal.toStringAsFixed(2)}",
        ),
        RowDetails(
          title: "Discount",
          value: "\$${(cubit.allSubtotal - cubit.totalAfterDiscount).toStringAsFixed(2)}",
        ),
        RowDetails(
          title: "Total",
          value: "\$${cubit.totalAfterDiscount.toStringAsFixed(2)}",
          textValueColor: AppColors.textAndBackgroundColorButton,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
