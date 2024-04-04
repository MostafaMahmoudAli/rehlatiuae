import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/info/presentation/views/widgets/privacy_section.dart';
import 'package:rehlatyuae/features/info/presentation/views/widgets/title_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thickness: 6.w,
        interactive: true,
        trackVisibility: true,
        thumbVisibility: true,
        radius: Radius.circular(10.r),
        child: ListView(
          children:  [
            TitleSection(
              title: LocaleKeys.Privacy_Policy.tr(),
              subTitle: LocaleKeys.Privacy_Policy.tr(),
              imagePath: AppAssets.rectangle.tr(),
            ),
            PrivacySection(
              title: LocaleKeys.Privacy_Policy.tr(),
              content: AppStrings.privacyPolicyContent,
            ),
          ],
        ),
      ),
    );
  }
}
