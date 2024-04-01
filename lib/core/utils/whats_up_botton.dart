import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class WhatsUpButton extends StatelessWidget {
  const WhatsUpButton(
      {super.key,
      required this.onTap,
      this.left,
      this.right,
      this.bottom,
      this.top,
      });

  final void Function()? onTap;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 40.0.w,
          height: 35.0.h,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0.r),
              bottomLeft: Radius.circular(8.0.r),
            ),
          ),
          child: Image.asset(
            AppStrings.whatsUpLogo,
          ),
        ),
      ),
    );
  }
}
