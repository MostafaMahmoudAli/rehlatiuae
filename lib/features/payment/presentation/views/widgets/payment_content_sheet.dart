import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';

class PaymentContentSheet extends StatelessWidget {
  final TripCheckoutDetails tripCheckoutDetails;
  final String? referenceNum;

  const PaymentContentSheet({
    required this.tripCheckoutDetails,
    this.referenceNum,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Total Amount",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.grayLight,
              ),
        ),
        Text(
          "\$ ${tripCheckoutDetails.total}",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
              ),
        ),
        RowDetails(
          title: "Date",
          value: tripCheckoutDetails.date,
        ),
        RowDetails(
          title: "Details",
          value: tripCheckoutDetails.description,
        ),
        if (referenceNum != null)
          RowDetails(
            title: "Reference num",
            value: referenceNum!,
          ),
        RowDetails(
          title: "Trip Date",
          value: tripCheckoutDetails.date,
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
          value: "\$${tripCheckoutDetails.finalSubtotal}",
        ),
        RowDetails(
          title: "Discount",
          value: "\$${tripCheckoutDetails.discount}",
        ),
        RowDetails(
          title: "Total",
          value: "\$${tripCheckoutDetails.total}",
          textValueColor: AppColors.textAndBackgroundColorButton,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
