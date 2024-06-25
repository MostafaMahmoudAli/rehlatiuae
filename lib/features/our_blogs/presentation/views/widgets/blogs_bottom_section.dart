import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_colors.dart';
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
import '../../../../layout_screen/presentation/views/widgets/top_destination_section.dart';
import '../../../../layout_screen/presentation/views/widgets/we_help_you_section.dart';
import '../../../../layout_screen/presentation/views/widgets/why_choose_us_section.dart';

class BlogsBottomSection extends StatelessWidget {
  const BlogsBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: BlocConsumer<LayoutCubit, LayoutState>(listener: (context, state) {
        state.whenOrNull(
          error: (errorMessage) => showDialog(
            context: context,
            builder: (context) => CustomDialog(
              title: errorMessage,
              subtitle: LocaleKeys.Sorry.tr(),
              labelText: LocaleKeys.Close.tr(),
            ),
          ),
        );
      }, builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (layoutModelSectionData) => Column(
            children: [
               TopDestinationSection(
                destinations:layoutModelSectionData.topDestinations ??[],
              ),
              const CustomSizedBox(),
               BestOffersSection(
                bestOffers:layoutModelSectionData.bestOffers?? [],
              ),
              const CustomSizedBox(),
               BestTripsSection(
                bestTrips:layoutModelSectionData.bestTrips?? [],
              ),
              const CustomSizedBox(),
               PopularExperiencesSection(
                popularExperiences:layoutModelSectionData.popularExperience?? [],
              ),
              const CustomSizedBox(),
              const WhyChooseUsSection(),
              const CustomSizedBox(),
               WeHelpYouSection(),
              Padding(
                padding:EdgeInsets.symmetric(
                  horizontal:15.0.w,
                  vertical: 10.0.h,
                ),
                child: CustomActionButton(
                  onTap: () {
                    context.push(AppRoutesString.allTripsScreen);
                  },
                  text: LocaleKeys.Explore_More.tr(),
                  height: 70.0.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(12.0.r),
                  backGroundColor: AppColors.orange,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const CustomSizedBox(),
               BestOffersHorizontal(
                bestOffers:layoutModelSectionData.bestOffers ?? [],
              ),
              const CustomSizedBox(),
               ReviewsSection(
                reviews:layoutModelSectionData.reviews ?? [],
              ),
            ],
          ),
          orElse: () => const SizedBox(),
        );
      }),
    );
  }
}
