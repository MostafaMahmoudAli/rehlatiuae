import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final List<Widget> trailing;
  final void Function()? onTap;

  const DrawerItem({
    required this.title,
    required this.iconPath,
    required this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: trailing,
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 0,
          )
        ],
      ),
    );
  }
}
