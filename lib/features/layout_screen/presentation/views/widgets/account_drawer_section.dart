import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/cusotm_bottom_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/currency_content_sheet.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/language_content_sheet.dart';

class AccountDrawerSection extends StatelessWidget {
  const AccountDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                "My Account",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            var cubit = context.read<MainCubit>();
            return Column(
              children: [
                DrawerItem(
                  title: 'Credits',
                  iconPath: AppAssets.credits,
                  trailing: [
                    Text(
                      "\$${cubit.totalUnPayedBooking}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                DrawerItem(
                  title: 'Currency',
                  iconPath: AppAssets.currency,
                  trailing: [
                    Text(
                      cubit.currentCurrency.name.toUpperCase(),
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
                      builder: (context) => BlocBuilder<MainCubit, MainState>(
                        builder: (context, state) {
                          return CustomBottomSheet(
                            title: 'Select Currency',
                            avatarText: context.read<MainCubit>().currentCurrency.name.toUpperCase(),
                            contentSheet: const CurrencyContentSheet(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        DrawerItem(
          title: 'Language',
          iconPath: AppAssets.language,
          trailing: [
            Text(
              "English",
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
              builder: (context) => const CustomBottomSheet(
                title: 'Select Language',
                avatarText: 'AR',
                contentSheet: LanguageContentSheet(),
              ),
            );
          },
        ),
        DrawerItem(
          title: 'Notifications',
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
