import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key?key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var cubit = context.read<MainCubit>();
        var currentLanguageCode = context.locale.languageCode; // Get the current language code
        return CurvedNavigationBar(
          key: Key('curvedNavigationBar_$currentLanguageCode'), // Add a key to force rebuild on language change
          items: [
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  AppAssets.homeIcon,
                ),
              ),
              label: LocaleKeys.Home.tr(),
              labelStyle: TextStyle(
                color: cubit.currentTab == 0 ? AppColors.textAndBackgroundColorButton : AppColors.white,
                fontSize: 12.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  AppAssets.searchIcon,
                ),
              ),
              label: LocaleKeys.Search.tr(),
              labelStyle: TextStyle(
                color: cubit.currentTab == 1 ? AppColors.textAndBackgroundColorButton : AppColors.white,
                fontSize: 12.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  AppAssets.bookingIcon,
                ),
              ),
              label: LocaleKeys.Booking.tr(),
              labelStyle: TextStyle(
                color: cubit.currentTab == 2 ? AppColors.textAndBackgroundColorButton : AppColors.white,
                fontSize: 12.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  AppAssets.whatsUpLogo,
                ),
              ),
              label: LocaleKeys.chatting.tr(),
              labelStyle: TextStyle(
                color: cubit.currentTab == 3 ? AppColors.textAndBackgroundColorButton : AppColors.white,
                fontSize: 12.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  AppAssets.accountIcon,
                ),
              ),
              label: LocaleKeys.Account.tr(),
              labelStyle: TextStyle(
                color: cubit.currentTab == 4 ? AppColors.textAndBackgroundColorButton : AppColors.white,
                fontSize: 12.sp,
              ),
            ),
          ],
          index: cubit.currentTab,
          onTap: cubit.changeCurrentTab,
          letIndexChange: (value) {
            if ((value == 4 || value == 2) && cubit.client == null) {
              context.push(AppRoutesString.loginScreen);
              return false;
            }
            return true;
          },
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColors.textAndBackgroundColorButton,
          color: AppColors.blogItemBackgroundColor,
          animationDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
