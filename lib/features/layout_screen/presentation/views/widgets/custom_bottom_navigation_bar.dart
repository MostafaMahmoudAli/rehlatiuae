import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function(int)? onTap;

  const CustomBottomNavigationBar({
    required this.onTap,
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;

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
          label: "Home",
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
          label: "Search",
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
          label: "Booking",
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
              fit:BoxFit.contain,
            ),
          ),
          label: "chat",
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
          label: "Account",
          labelStyle: TextStyle(
            color: index == 4 ? AppColors.textAndBackgroundColorButton : AppColors.white,
            fontSize: 12.sp,
          ),
        ),
      ],
      index: index,
      onTap: (selectedIndex) {
        setState(() {
          index = selectedIndex;
          widget.onTap?.call(index);
        });
      },
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppColors.textAndBackgroundColorButton,
      color: AppColors.blogItemBackgroundColor,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
