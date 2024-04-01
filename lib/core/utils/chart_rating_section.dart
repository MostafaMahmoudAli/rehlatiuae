import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_rating_bar.dart';

class ChartRatingSection extends StatelessWidget {
  const ChartRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ratings & Reviews",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.star_border_rounded,
              size: 25.h,
              color: AppColors.textAndBackgroundColorButton,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "4.2 (852)",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const CustomRatingBar(
          starCount: 5,
          ratingCount: 180,
          progressPercent: 0.8,
        ),
        const CustomRatingBar(
          starCount: 4,
          ratingCount: 249,
          progressPercent: 0.5,
        ),
        const CustomRatingBar(
          starCount: 3,
          ratingCount: 180,
          progressPercent: 0.3,
        ),
        const CustomRatingBar(
          starCount: 2,
          ratingCount: 180,
          progressPercent: 0.2,
        ),
        const CustomRatingBar(
          starCount: 1,
          ratingCount: 180,
          progressPercent: 0.1,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
