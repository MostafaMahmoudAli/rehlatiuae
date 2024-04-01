import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/utils/custom_dialog.dart';
import '../../../../../core/utils/custom_sized_box.dart';
import '../../../../../core/utils/injector.dart';
import '../../../../../core/utils/popular_experiences.dart';
import '../../../../layout_screen/presentation/cubits/layout_cubit.dart';
import '../../../../layout_screen/presentation/views/widgets/best_offers_horizontal.dart';
import '../../../../layout_screen/presentation/views/widgets/best_offers_section.dart';
import '../../../../layout_screen/presentation/views/widgets/best_trips_section.dart';
import '../../../../layout_screen/presentation/views/widgets/reviews_section.dart';
import '../../../../layout_screen/presentation/views/widgets/we_help_you_section.dart';
import '../../../../layout_screen/presentation/views/widgets/why_choose_us_section.dart';

class AllDestinationBottomSection extends StatelessWidget {
  const AllDestinationBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<LayoutCubit>()
        ..fetchLayoutData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
          listener: (context, state) {
            state.whenOrNull(
                error: (errorMessage) =>
                    showDialog(
                      context: context,
                      builder: (context) =>
                          CustomDialog(
                            title: errorMessage,
                            subtitle: 'Sorry',
                            labelText: 'Close',
                          ),
                    ),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const SizedBox(),
              loaded: (layoutModelSectionData) =>Column(
                    children: [
                      const CustomSizedBox(),
                      const CustomSizedBox(),
                      BestOffersSection(
                        bestOffers: layoutModelSectionData.bestOffers ?? [],
                      ),
                      const CustomSizedBox(),
                      BestTripsSection(
                        bestTrips: layoutModelSectionData.bestTrips ?? [],
                      ),
                      const CustomSizedBox(),
                      PopularExperiencesSection(
                        popularExperiences: layoutModelSectionData
                            .popularExperience ?? [],
                      ),
                      const CustomSizedBox(),
                      const WhyChooseUsSection(),
                      const CustomSizedBox(),
                      const WeHelpYouSection(),
                      CustomActionButton(
                        onTap: () {
                          context.push(AppStrings.allTripsScreen);
                        },
                        text: AppStrings.actionButtonName,
                        height: 70.0.h,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(12.0.r),
                        backGroundColor: AppColors.orange,
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,
                      ),
                      const CustomSizedBox(),
                      const BestOffersHorizontal(),
                      const CustomSizedBox(),
                      ReviewsSection(
                        reviews: layoutModelSectionData.reviews ?? [],
                      ),
                    ],
                  ),
              orElse: () => const SizedBox(),
            );
          }),
    );
  }
}
