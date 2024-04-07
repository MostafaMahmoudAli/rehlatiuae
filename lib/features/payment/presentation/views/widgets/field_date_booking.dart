import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class FieldDateBooking extends StatelessWidget {
  final TripCheckoutDetailsCubit cubit;

  const FieldDateBooking({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      label: LocaleKeys.Your_date_booking.tr(),
      hint: LocaleKeys.Select_a_date.tr(),
      controller: cubit.dateEditingController,
      readOnly: true,
      validator: (value) => AppValidator.validateRequired(value),
      onTap: () async {
        cubit.dateEditingController.text = await Pickers.choseDate(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
            ) ??
            '';
        if (context.mounted) {
          cubit.changeChangeDetails();
          cubit.tripCheckoutDetails = cubit.tripCheckoutDetails!.copyWith(
            date: cubit.dateEditingController.text,
          );
        }
      },
      suffix: const Icon(CupertinoIcons.calendar),
    );
  }
}
