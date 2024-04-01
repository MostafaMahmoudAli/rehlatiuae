import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/primary_text_field.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/add_review_cubit/add_review_cubit.dart';

class ReviewOperationSection extends StatefulWidget {
  final int id;

  const ReviewOperationSection({super.key, required this.id});

  @override
  State<ReviewOperationSection> createState() => _ReviewOperationSectionState();
}

class _ReviewOperationSectionState extends State<ReviewOperationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.whiteAppColor,
              backgroundImage: CachedNetworkImageProvider(
                context.read<MainCubit>().client!.imagePath,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              context.read<MainCubit>().client!.name,
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
                  padding: EdgeInsets.symmetric(
                    vertical: cubit.pickedImage != null ? 300.h : 125.h,
                  ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            cubit.pickedImage = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (cubit.pickedImage != null) {
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.attach_file,
                          ),
                        ),
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
                    if (cubit.pickedImage != null)
                      Container(
                        height: 250.h,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: FileImage(
                              File(cubit.pickedImage!.path),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 35.h),
                      child: CustomActionButton(
                        text: 'Rating Now',
                        borderRadius: BorderRadius.circular(16),
                        backGroundColor: AppColors.textAndBackgroundColorButton,
                        onTap: () async {
                          if (context.read<MainCubit>().client != null) {
                            await cubit.addReview(
                              id: widget.id,
                              name: context.read<MainCubit>().client!.name,
                            );
                          } else {
                            context.push(AppStrings.loginScreen);
                          }
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
      ],
    );
  }
}
