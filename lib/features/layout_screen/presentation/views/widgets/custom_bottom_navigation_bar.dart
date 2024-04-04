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
  final int index;
  final void Function(int)? onTap;

  const CustomBottomNavigationBar({
    required this.onTap,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
            color: index == 0 ? AppColors.textAndBackgroundColorButton : AppColors.white,
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
            color: index == 1 ? AppColors.textAndBackgroundColorButton : AppColors.white,
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
            color: index == 2 ? AppColors.textAndBackgroundColorButton : AppColors.white,
            fontSize: 12.sp,
          ),
        ),
        CurvedNavigationBarItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Image.asset(
              AppAssets.whatsUpLogo,
              fit: BoxFit.contain,
            ),
          ),
          label: 'chat',
          labelStyle: TextStyle(
            color: index == 3 ? AppColors.textAndBackgroundColorButton : AppColors.white,
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
            color: index == 4 ? AppColors.textAndBackgroundColorButton : AppColors.white,
            fontSize: 12.sp,
          ),
        ),
      ],
      index: index,
      onTap: (selectedIndex) {
        onTap?.call(selectedIndex);
      },
      letIndexChange: (value) {
        if (value == 4 && context.read<MainCubit>().client == null) {
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
  }
}
