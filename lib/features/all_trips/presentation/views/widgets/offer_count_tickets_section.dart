import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_number_ticket_card.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class OfferCountTicketsSection extends StatefulWidget {
  final double adultCost;
  final double childCost;
  final void Function(int count, double total) onAdultsCountChange;
  final void Function(int count, double total) onChildrenCountChange;

  const OfferCountTicketsSection({
    required this.adultCost,
    required this.childCost,
    required this.onChildrenCountChange,
    required this.onAdultsCountChange,
    super.key,
  });

  @override
  State<OfferCountTicketsSection> createState() => _OfferCountTicketsSectionState();
}

class _OfferCountTicketsSectionState extends State<OfferCountTicketsSection> {
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
        OfferCountTicketCard(
          name: LocaleKeys.Adult.tr(),
          detail: LocaleKeys.Above_four_yrs.tr(),
          count: adultCount,
          total: subtotalAdult,
          onIncreasePressed: () {
            setState(
              () {
                ++adultCount;
                subtotalAdult = adultCount * widget.adultCost;
                widget.onAdultsCountChange(adultCount, subtotalAdult);
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
                      widget.onAdultsCountChange(adultCount, subtotalAdult);
                    },
                  );
                },
        ),
        OfferCountTicketCard(
          name: LocaleKeys.Children.tr(),
          detail: LocaleKeys.Under_three_yrs.tr(),
          count: childCount,
          total: subtotalChild,
          onIncreasePressed: () {
            setState(
              () {
                ++childCount;
                subtotalChild = childCount * widget.childCost;
                widget.onChildrenCountChange(childCount, subtotalChild);
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
                      widget.onChildrenCountChange(childCount, subtotalChild);
                    },
                  );
                },
        ),
      ],
    );
  }
}
