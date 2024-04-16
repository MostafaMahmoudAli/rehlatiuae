import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/payment/presentation/views/widgets/number_ticket_card.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class CountTicketsSection extends StatefulWidget {
  final double adultCost;
  final double childCost;
  final void Function(int count, double total) onAdultsCountChange;
  final void Function(int count, double total) onChildrenCountChange;

  const CountTicketsSection({
    required this.adultCost,
    required this.childCost,
    required this.onChildrenCountChange,
    required this.onAdultsCountChange,
    super.key,
  });

  @override
  State<CountTicketsSection> createState() => _CountTicketsSectionState();
}

class _CountTicketsSectionState extends State<CountTicketsSection> {
  String selectedCard = '';
  int adultCount = 1, childCount = 0;
  double subtotalAdult = 0, subtotalChild = 0;

  @override
  void initState() {
    super.initState();
    subtotalAdult = widget.adultCost;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountTicketCard(
          name: LocaleKeys.Adult.tr(),
          detail: LocaleKeys.Above_four_yrs.tr(),
          count: adultCount,
          total: subtotalAdult,
          onIncreasePressed: () {
            setState(
              () {
                ++adultCount;
                subtotalAdult = adultCount * widget.adultCost;
                widget.onAdultsCountChange(adultCount, widget.adultCost);
              },
            );
          },
          onDecreasePressed: adultCount <= 1
              ? null
              : () {
                  setState(
                    () {
                      --adultCount;
                      subtotalAdult = adultCount * widget.adultCost;
                      widget.onAdultsCountChange(adultCount, -widget.adultCost);
                    },
                  );
                },
        ),
        CountTicketCard(
          name: LocaleKeys.Children.tr(),
          detail: LocaleKeys.Under_three_yrs.tr(),
          count: childCount,
          total: subtotalChild,
          onIncreasePressed: () {
            setState(
              () {
                ++childCount;
                subtotalChild = childCount * widget.childCost;
                widget.onChildrenCountChange(childCount, widget.childCost);
              },
            );
          },
          onDecreasePressed: childCount <= 0
              ? null
              : () {
                  setState(
                    () {
                      --childCount;
                      subtotalChild = childCount * widget.childCost;
                      widget.onChildrenCountChange(childCount, -widget.childCost);
                    },
                  );
                },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.Total_Amount.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "\$${subtotalAdult + subtotalChild}",
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
