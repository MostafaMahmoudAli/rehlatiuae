import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_icon_button.dart';

class OfferCountTicketCard extends StatelessWidget {
  final String name;
  final String detail;
  final int count;
  final double total;
  final void Function()? onIncreasePressed;
  final void Function()? onDecreasePressed;

  const OfferCountTicketCard({
    required this.name,
    required this.detail,
    required this.count,
    required this.total,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adult',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Abov 4 yrs',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              Row(
                children: [
                  CustomIconButton(
                    icon: CupertinoIcons.minus,
                    iconColor: AppColors.textAndBackgroundColorButton,
                    backgroundColor: AppColors.white.withOpacity(0.6),
                    size: 25,
                    radius: 50,
                    iconSize: 12,
                    onPressed: onDecreasePressed,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "$count",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomIconButton(
                    icon: CupertinoIcons.add,
                    iconColor: AppColors.textAndBackgroundColorButton,
                    backgroundColor: AppColors.white.withOpacity(0.6),
                    size: 25,
                    radius: 50,
                    iconSize: 12,
                    onPressed: onIncreasePressed,
                  ),
                ],
              ),
            ],
          ),
          Text(
            "\$ $total",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
