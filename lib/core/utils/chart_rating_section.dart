import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_rating_bar.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';

class ChartRatingSection extends StatelessWidget {
  final ReviewCount? reviewsCount;

  const ChartRatingSection({
    this.reviewsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int total = reviewsCount!.oneStar! +
        reviewsCount!.towStar! +
        reviewsCount!.threeStar! +
        reviewsCount!.fourStar! +
        reviewsCount!.fiveStar!;

    double ave = 0;
    if (total != 0) {
      ave = (reviewsCount!.oneStar! +
              reviewsCount!.towStar! * 2 +
              reviewsCount!.threeStar! * 3 +
              reviewsCount!.fourStar! * 4 +
              reviewsCount!.fiveStar! * 5) /
          total;
    }
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
              "$ave ($total)",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        CustomRatingBar(
          starCount: 5,
          ratingCount: reviewsCount!.fiveStar ?? 0,
          progressPercent: total != 0 ? reviewsCount!.fiveStar! / total : 0,
        ),
        CustomRatingBar(
          starCount: 4,
          ratingCount: reviewsCount!.fourStar ?? 0,
          progressPercent: total != 0 ? reviewsCount!.fourStar! / total : 0,
        ),
        CustomRatingBar(
          starCount: 3,
          ratingCount: reviewsCount!.threeStar ?? 0,
          progressPercent: total != 0 ? reviewsCount!.threeStar! / total : 0,
        ),
        CustomRatingBar(
          starCount: 2,
          ratingCount: reviewsCount!.towStar ?? 0,
          progressPercent: total != 0 ? reviewsCount!.towStar! / total : 0,
        ),
        CustomRatingBar(
          starCount: 1,
          ratingCount: reviewsCount!.oneStar ?? 0,
          progressPercent: total != 0 ? reviewsCount!.oneStar! / total : 0,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
