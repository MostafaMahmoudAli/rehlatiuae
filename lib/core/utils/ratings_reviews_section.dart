import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/chart_rating_section.dart';
import 'package:rehlatyuae/core/utils/comment_card.dart';
import 'package:rehlatyuae/core/utils/review_operation_section.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class RatingsReviewsSection extends StatelessWidget {
  final List<Review>? reviews;
  final int? id;
  final bool isTrip;
  final ReviewCount? reviewsCount;

  const RatingsReviewsSection({
    this.reviews,
    this.isTrip = true,
    this.reviewsCount,
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartRatingSection(reviewsCount: reviewsCount),
          if (context.read<MainCubit>().client != null)
            ReviewOperationSection(
              id: id ?? 0,
              isTrip: isTrip,
            ),
          ...List.generate(
            reviews!.length,
            (index) => CommentCard(
              imageUrl: reviews![index].client!.imagePath,
              name: reviews![index].name!,
              date: reviews![index].createdAt!,
              comment: reviews![index].description!,
            ),
          ),
        ],
      ),
    );
  }
}
