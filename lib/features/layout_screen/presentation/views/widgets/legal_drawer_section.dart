import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class LegalDrawerSection extends StatelessWidget {
  const LegalDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              Text(
                LocaleKeys.Legal.tr(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: LocaleKeys.Privacy_Policy.tr(),
          iconPath: AppAssets.privacyPolicy,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            context.push('/privacyPolicyScreen');
          },
        ),
        DrawerItem(
          title: LocaleKeys.Terms_of_Usage.tr(),
          iconPath: AppAssets.terms,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            context.push('/termsConditionsScreen');
          },
        ),
        SizedBox(
          height: 30.h,
        ),
         DrawerItem(
          title: LocaleKeys.Update_App.tr(),
          iconPath: AppAssets.updateApp,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
        ),
        DrawerItem(
          title: LocaleKeys.About_App.tr(),
          iconPath: AppAssets.aboutApp,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
          onTap: () {
            context.push('/aboutUsScreen');
          },
        ),
         DrawerItem(
          title: LocaleKeys.Logout.tr(),
          iconPath: AppAssets.logout,
          trailing: const [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
        ),
      ],
    );
  }
}
