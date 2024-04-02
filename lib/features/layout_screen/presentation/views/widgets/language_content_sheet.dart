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
        const RowDetails(
          title: LocaleKeys.Arabic,
          value: 'AR',
        ),
        const RowDetails(
          title: LocaleKeys.United_States,
          value: 'USD \$',
          
        ),
        const RowDetails(
          title: LocaleKeys.URDU,
          value: 'UR',
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
