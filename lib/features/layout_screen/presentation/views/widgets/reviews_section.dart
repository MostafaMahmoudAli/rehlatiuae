import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';

import '../../../../../core/utils/custom_dialog.dart';
import '../../../../../core/utils/regex.dart';
import '../../../data/models/review_model.dart';
import '../../cubits/subcription_section_cubit/subscription_section_cubit.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<Review>? reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.reviewTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const CustomSizedBox(),
        SizedBox(
          height: 350.0.h,
          child: ListView.separated(
            itemCount: reviews?.length ?? 0,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCircleAvatar(
                        radius: 40.0.r,
                        backgroundImage: CachedNetworkImageProvider(
                          reviews?[index].client?.imagePath ??
                              "assets/images/Ellipse 1.png",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SizedBox(
                        width: 210.0.w,
                        child: Text(
                          reviews?[index].description ??
                          AppStrings.weHelpYouMakeBestTripDescription,
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12.0.w,),
                      Text(
                        reviews?[index].name ?? "",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.4,),
                      if (reviews?[index].starsNumber != null)
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellow,
                            ),
                            Text(
                              " ${reviews?[index].starsNumber.toString()}/5 ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                    ],
                  ),

                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20.0.w,
            ),
          ),
        ),
        SizedBox(
          height: 40.0.h,
        ),
        Text(
          AppStrings.subscribeToNewsletterTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 10.0.h,
        ),
        const SubscriptionSection(),
        SizedBox(
          height: 50.0.h,
        ),
        Text(
          AppStrings.copyRight,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14.0.sp,
              ),
        ),
      ],
    );
  }
}

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubscriptionSectionCubit>(),
      child: BlocConsumer<SubscriptionSectionCubit, SubscriptionSectionState>(
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
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Padding(
              padding: EdgeInsets.symmetric(vertical: 200.h),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            orElse: () => Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 12.0.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Form(
                  key:
                      context.read<SubscriptionSectionCubit>().subscribeFormKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 60.0.h,
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          border: Border.all(color: AppColors.greySearchText),
                        ),
                        child: TextFormField(
                          controller: context
                              .read<SubscriptionSectionCubit>()
                              .subscribeNameEditingController,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppStrings.reviewTextFieldName,
                            hintStyle:
                                Theme.of(context).textTheme.headlineSmall,
                          ),
                          validator: (value) =>
                              AppValidator.validateName(value),
                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 60.0.h,
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 10.0.w),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0.r),
                          border: Border.all(color: AppColors.greySearchText),
                        ),
                        child: TextFormField(
                          controller: context
                              .read<SubscriptionSectionCubit>()
                              .subscribeMailEditingController,
                          maxLines: 2,
                          minLines: 1,
                          validator: (value) =>
                              AppValidator.validateEmail(value),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppStrings.reviewTextFieldEmail,
                            hintStyle:
                                Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      CustomActionButton(
                        text: AppStrings.reviewActionButtonName,
                        borderRadius: BorderRadius.circular(8.0.r),
                        backGroundColor: AppColors.textAndBackgroundColorButton,
                        onTap: () async {
                          await context
                              .read<SubscriptionSectionCubit>()
                              .sendSubscribe();
                          getIt<SubscriptionSectionCubit>()
                              .subscribeMailEditingController
                              .clear();
                          getIt<SubscriptionSectionCubit>()
                              .subscribeNameEditingController
                              .clear();
                        },
                        width: double.infinity,
                        height: 40.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
