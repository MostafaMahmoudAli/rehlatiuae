import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rehlatyuae/core/utils/pickers.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/core/utils/regex.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class FieldDateBooking extends StatelessWidget {
  final TextEditingController controller;

  const FieldDateBooking({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      label: LocaleKeys.Your_date_booking.tr(),
      hint: LocaleKeys.Select_a_date.tr(),
      controller: controller,
      readOnly: true,
      validator: (value) => AppValidator.validateRequired(value),
      onTap: () async {
        controller.text = await Pickers.choseDate(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
            ) ??
            '';
      },
      suffix: const Icon(CupertinoIcons.calendar),
    );
  }
}
