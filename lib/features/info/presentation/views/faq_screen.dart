import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/custom_expansion_tile.dart';
import 'package:rehlatyuae/features/info/presentation/views/widgets/title_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const TitleSection(
            title: "FAQs",
            subTitle: "FAQs",
            imagePath: AppAssets.rectangle,
          ),
          CustomExpansionTile(
            title: LocaleKeys.Start_date_Rehlatyuae.tr(),
            content: LocaleKeys.Founding_Year_of_Rehlatyuae.tr(),
          ),
          CustomExpansionTile(
            title: LocaleKeys.Number_of_our_clients.tr(),
            content: LocaleKeys.Guests_served.tr(),
          ),
          CustomExpansionTile(
            title: LocaleKeys.Number_of_evaluations_received.tr(),
            content: LocaleKeys.Reviews_Rehlatyuae.tr(),
          ),
        ],
      ),
    );
  }
}
