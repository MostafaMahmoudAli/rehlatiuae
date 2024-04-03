import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/drawer_item.dart';

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
                "Legal",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ),
        DrawerItem(
          title: 'Privacy Policy',
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
          title: 'Terms of Usage',
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
        const DrawerItem(
          title: 'Update App',
          iconPath: AppAssets.updateApp,
          trailing: [
            Icon(
              Icons.arrow_forward_ios_sharp,
            ),
          ],
        ),
        DrawerItem(
          title: 'About App',
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
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return context.read<MainCubit>().client != null
                ? DrawerItem(
                    title: 'Logout',
                    iconPath: AppAssets.logout,
                    trailing: const [
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                      ),
                    ],
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          title: "Are you sure from logout",
                          subtitle: 'Logout',
                          labelText: 'Logout',
                          color: AppColors.redAppColor,
                          onTap: () async {
                            context.pop();
                            await context.read<MainCubit>().logout();
                          },
                        ),
                      );
                    },
                  )
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
