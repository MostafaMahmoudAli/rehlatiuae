import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/comment_card.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/custom_rating_bar.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/add_review_cubit/add_review_cubit.dart';

class RatingsReviewsSection extends StatelessWidget {
  const RatingsReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
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
          Row(
            children: [
              const CustomCircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppAssets.profile),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Mohammad',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          BlocProvider<AddReviewCubit>(
            create: (context) => getIt<AddReviewCubit>(),
            child: BlocConsumer<AddReviewCubit, AddReviewState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (message) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: message,
                        subtitle: 'Sorry',
                        labelText: 'Close',
                        color: AppColors.redAppColor,
                      ),
                    );
                  },
                  loaded: (review) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Rating Register Successfully',
                        subtitle: 'Done',
                        labelText: 'Close',
                        onTap: () {},
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                var cubit = context.read<AddReviewCubit>();
                return state.maybeWhen(
                  loading: () => Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.h),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  orElse: () => Column(
                    children: [
                      PrimaryTextField(
                        controller: cubit.descriptionEditingController,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        hint: 'Rating message',
                        textColor: AppColors.grayLight,
                        isTextAria: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RatingBar(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star_rounded,
                                size: 18.h,
                                color: AppColors.yellow,
                              ),
                              empty: Icon(
                                Icons.star_border_rounded,
                                size: 18.h,
                                color: AppColors.textAndBackgroundColorButton,
                              ),
                              half: Icon(
                                Icons.star_half_rounded,
                                size: 18.h,
                                color: AppColors.yellow,
                              ),
                            ),
                            glow: false,
                            onRatingUpdate: (rating) {
                              cubit.ratingNumber = rating.toInt();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 35.h),
                        child: CustomActionButton(
                          text: 'Rating Now',
                          borderRadius: BorderRadius.circular(16),
                          backGroundColor: AppColors.textAndBackgroundColorButton,
                          onTap: () async {
                            await cubit.addReview();
                          },
                          width: double.infinity,
                          height: 50.h,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ...List.generate(
            3,
            (index) => const CommentCard(
              imageUrl: AppAssets.profile,
              name: "Lee Mohammad",
              date: "12/12/2024",
              comment:
                  "The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A  you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia,",
            ),
          ),
        ],
      ),
    );
  }
}
