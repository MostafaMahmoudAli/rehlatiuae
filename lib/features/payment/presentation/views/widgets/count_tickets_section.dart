import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/number_ticket_card.dart';

class CountTicketsSection extends StatefulWidget {
  final void Function(int value) onAdultsCountChange;
  final void Function(int value) onChildrenCountChange;

  const CountTicketsSection({
    required this.onChildrenCountChange,
    required this.onAdultsCountChange,
    super.key,
  });

  @override
  State<CountTicketsSection> createState() => _CountTicketsSectionState();
}

class _CountTicketsSectionState extends State<CountTicketsSection> {
  String selectedCard = '';
  int adultNumber = 1, childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              Text(
                AppStrings.selectNumberTicket,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        CountTicketCard(
          name: AppStrings.adult,
          detail: AppStrings.above4Yrs,
          count: adultNumber,
          total: adultNumber * 10,
          onIncreasePressed: () {
            setState(() {
              ++adultNumber;
              widget.onAdultsCountChange(adultNumber);
            });
          },
          onDecreasePressed: adultNumber <= 1
              ? null
              : () {
                  setState(() {
                    --adultNumber;
                    widget.onAdultsCountChange(adultNumber);
                  });
                },
        ),
        CountTicketCard(
          name: AppStrings.children,
          detail: AppStrings.under3Yrs,
          count: childCount,
          total: childCount * 5,
          onIncreasePressed: () {
            setState(() {
              ++childCount;
              widget.onChildrenCountChange(childCount);
            });
          },
          onDecreasePressed: childCount <= 0
              ? null
              : () {
                  setState(() {
                    --childCount;
                    widget.onChildrenCountChange(childCount);
                  });
                },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "\$0.00",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
