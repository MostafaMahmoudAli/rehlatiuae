import 'package:flutter/cupertino.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';

class FieldDateBooking extends StatelessWidget {
  final TripCheckoutDetailsCubit cubit;
  final bool isFirstScreen;

  const FieldDateBooking({super.key, required this.cubit, this.isFirstScreen = true});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: isFirstScreen ? cubit.dateFormKey : cubit.date2FormKey,
      child: PrimaryTextField(
        label: AppStrings.yourDateBooking,
        hint: AppStrings.selectDate,
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
            cubit.tripCheckoutDetails = cubit.tripCheckoutDetails.copyWith(
              date: cubit.dateEditingController.text,
            );
          }
        },
        suffix: const Icon(CupertinoIcons.calendar),
      ),
    );
  }
}
