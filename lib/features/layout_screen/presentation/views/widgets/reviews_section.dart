import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_dialog.dart';
import '../../../../../core/utils/primary_text_field.dart';
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
          LocaleKeys.Our_Client_Reviews.tr(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const CustomSizedBox(),
        SizedBox(
          height: 350.0.h,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
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
                          reviews?[index].client?.imagePath ?? "assets/images/Ellipse 1.png",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SizedBox(
                        width: 210.0.w,
                        child: Text(
                          reviews?[index].description ?? AppStrings.weHelpYouMakeBestTripDescription,
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
                      SizedBox(
                        width: 12.0.w,
                      ),
                      Text(
                        reviews?[index].name ?? "",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                      ),
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
          height: 20.0.h,
        ),
        Text(
          LocaleKeys.Subscribe_to_Newsletter.tr(),
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
          LocaleKeys.Copyright.tr(),
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
                  subtitle: LocaleKeys.Sorry.tr(),
                  labelText: LocaleKeys.Close.tr(),
                  color: AppColors.redAppColor,
                ),
              );
            },
            loaded: () {
              //is done
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: LocaleKeys.You_have_successfully_subscribed_to_the_newsletter.tr(),
                  subtitle: LocaleKeys.Done.tr(),
                  labelText: LocaleKeys.Close.tr(),
                  onTap: ()
                  {
                    context.pop(true);
                  },
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
            orElse: () => Form(
              key: context.read<SubscriptionSectionCubit>().subscribeFormKey,
              child: Column(
                children: [
                  PrimaryTextField(
                    controller: context.read<SubscriptionSectionCubit>().subscribeNameEditingController,
                    hint: LocaleKeys.Name.tr(),
                    inputType: TextInputType.name,
                    validator: (value) => AppValidator.validateName(value),
                  ),
                  PrimaryTextField(
                    controller: context.read<SubscriptionSectionCubit>().subscribeMailEditingController,
                    hint: LocaleKeys.Email.tr(),
                    inputType: TextInputType.emailAddress,
                    validator: (value) => AppValidator.validateEmail(value),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.w),
                    child: CustomActionButton(
                      text: LocaleKeys.Send_Now.tr(),
                      borderRadius: BorderRadius.circular(8.0.r),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await context.read<SubscriptionSectionCubit>().sendSubscribe();
                        getIt<SubscriptionSectionCubit>().subscribeMailEditingController.clear();
                        getIt<SubscriptionSectionCubit>().subscribeNameEditingController.clear();
                      },
                      width: double.infinity,
                      height: 40.0.h,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
