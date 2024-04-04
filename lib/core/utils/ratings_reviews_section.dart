import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/chart_rating_section.dart';
import 'package:rehlatyuae/core/utils/comment_card.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/review_operation_section.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

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
    List<Review> clientReviews = [];
    List<Review> reviews = [];
    var client = context.read<MainCubit>().client;
    reviews = [...this.reviews!];
    if (context.read<MainCubit>().client != null) {
      clientReviews = this
          .reviews!
          .where(
            (element) => element.client!.id == client!.id,
          )
          .toList();
      reviews.removeWhere(
        (element) => element.client!.id == client!.id,
      );
    }
    return BlocProvider<AddReviewCubit>(
      create: (context) => getIt<AddReviewCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartRatingSection(reviewsCount: reviewsCount),
            ReviewOperationSection(
              id: id ?? 0,
              isTrip: isTrip,
            ),
            BlocBuilder<AddReviewCubit, AddReviewState>(
              builder: (c, state) {
                return state.maybeWhen(
                  edited: (review) => CommentCard(
                    imageUrl: review.client!.imagePath,
                    name: review.name!,
                    date: review.createdAt!,
                    comment: review.description!,
                    hasActionsIcons: true,
                    onEditTap: () {
                      c.read<AddReviewCubit>().editReview(
                            review: review,
                            context: context,
                          );
                    },
                    onDeleteTap: () async {
                      await c.read<AddReviewCubit>().deleteReview(
                            id: id!,
                            isTrip: isTrip,
                          );
                    },
                  ),
                  loaded: (review) => CommentCard(
                    imageUrl: review.client!.imagePath,
                    name: review.name!,
                    date: review.createdAt!,
                    comment: review.description!,
                    hasActionsIcons: true,
                    onEditTap: () {
                      c.read<AddReviewCubit>().editReview(
                            review: review,
                            context: context,
                          );
                    },
                    onDeleteTap: () async {
                      await c.read<AddReviewCubit>().deleteReview(
                            id: id!,
                            isTrip: isTrip,
                          );
                    },
                  ),
                  deleted: () => const SizedBox(),
                  orElse: () => clientReviews.isNotEmpty
                      ? CommentCard(
                          imageUrl: clientReviews[0].client!.imagePath,
                          name: clientReviews[0].name!,
                          date: clientReviews[0].createdAt!,
                          comment: clientReviews[0].description!,
                          hasActionsIcons: true,
                          onEditTap: () {
                            c.read<AddReviewCubit>().editReview(
                                  review: clientReviews[0],
                                  context: context,
                                );
                          },
                          onDeleteTap: () async {
                            await c.read<AddReviewCubit>().deleteReview(
                                  id: id!,
                                  isTrip: isTrip,
                                );
                          },
                        )
                      : const SizedBox(),
                );
              },
            ),
            ...List.generate(
              reviews.length,
              (index) => CommentCard(
                imageUrl: reviews[index].client!.imagePath,
                name: reviews[index].name!,
                date: reviews[index].createdAt!,
                comment: reviews[index].description!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
