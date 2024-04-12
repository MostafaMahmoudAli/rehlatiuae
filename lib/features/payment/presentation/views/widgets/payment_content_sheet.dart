import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

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
          "\$ ${totalAfterDiscount.toStringAsFixed(2)}",
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
          RowDetails(
            title: "Payment Id",
            value: paymentId!,
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
          value: "\$${(allSubtotal - totalAfterDiscount).toStringAsFixed(2)}",
        ),
        RowDetails(
          title: "Total",
          value: "\$${totalAfterDiscount.toStringAsFixed(2)}",
          textValueColor: AppColors.textAndBackgroundColorButton,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
