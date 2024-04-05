import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_rating_bar.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';

class ChartRatingSection extends StatelessWidget {
  final ReviewCount? reviewsCount;
  final int totalRating;
  final double aveRating;

  const ChartRatingSection({
    this.reviewsCount,
    required this.totalRating,
    required this.aveRating,
    super.key,
  });

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
            Row(
              children: [
                Text(
                  aveRating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  " ($totalRating)",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        CustomRatingBar(
          starCount: 5,
          ratingCount: reviewsCount!.fiveStar ?? 0,
          progressPercent: totalRating != 0 ? reviewsCount!.fiveStar! / totalRating : 0,
        ),
        CustomRatingBar(
          starCount: 4,
          ratingCount: reviewsCount!.fourStar ?? 0,
          progressPercent: totalRating != 0 ? reviewsCount!.fourStar! / totalRating : 0,
        ),
        CustomRatingBar(
          starCount: 3,
          ratingCount: reviewsCount!.threeStar ?? 0,
          progressPercent: totalRating != 0 ? reviewsCount!.threeStar! / totalRating : 0,
        ),
        CustomRatingBar(
          starCount: 2,
          ratingCount: reviewsCount!.towStar ?? 0,
          progressPercent: totalRating != 0 ? reviewsCount!.towStar! / totalRating : 0,
        ),
        CustomRatingBar(
          starCount: 1,
          ratingCount: reviewsCount!.oneStar ?? 0,
          progressPercent: totalRating != 0 ? reviewsCount!.oneStar! / totalRating : 0,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
