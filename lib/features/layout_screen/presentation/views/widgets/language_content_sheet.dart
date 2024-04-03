import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class LanguageContentSheet extends StatelessWidget {
  const LanguageContentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         RowDetails(
          title: LocaleKeys.Arabic,
          value: 'AR',
          onTap: () async {
            await context.setLocale(const Locale('ar'));
          },
        ),
         RowDetails(
          title: LocaleKeys.United_States,
          value: 'USD \$',
         onTap: () async {
          await context.setLocale(const Locale('en'));
         },
        ),
         RowDetails(
          title: LocaleKeys.URDU,
          value: 'UR',
          onTap: () async {
           await context.setLocale(const Locale('ur'));
           },
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
