import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/currency_content_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/language_content_sheet.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AccountDrawerSection extends StatelessWidget {
  const AccountDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 20.h,
          ),
          child: Row(
            children: [
              Text(
                LocaleKeys.My_Account.tr(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: LocaleKeys.Credits.tr(),
          iconPath: AppAssets.credits,
          trailing: [
            Text(
              "\$0.0",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        DrawerItem(
          title: LocaleKeys.Currency.tr(),
          iconPath: AppAssets.currency,
          trailing: [
            Text(
              "USD\$",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              builder: (context) => CustomBottomSheet(
                title: LocaleKeys.Select_Currency.tr(),
                avatarText: '\$',
                contentSheet: const CurrencyContentSheet(),
              ),
            );
          },
        ),
        DrawerItem(
          title: LocaleKeys.Language.tr(),
          iconPath: AppAssets.language,
          trailing: [
            Text(
              LocaleKeys.en.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              builder: (context) => CustomBottomSheet(
                title: LocaleKeys.Select_Language.tr(),
                avatarText: 'AR',
                contentSheet: const LanguageContentSheet(),
              ),
            );
          },
        ),
        DrawerItem(
          title: LocaleKeys.Notifications.tr(),
          iconPath: AppAssets.notifications,
          trailing: [
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: true,
                onChanged: (value) {},
                trackOutlineWidth: MaterialStateProperty.resolveWith<double?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return 2.0;
                    }
                    return 2.0;
                  },
                ),
                trackColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return AppColors.textAndBackgroundColorButton;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
