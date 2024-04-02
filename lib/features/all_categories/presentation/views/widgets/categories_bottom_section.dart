import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../../core/utils/custom_sized_box.dart';
import '../../../../../core/utils/injector.dart';
import '../../../../../core/utils/popular_experiences.dart';
import '../../../../layout_screen/presentation/cubits/layout_cubit.dart';
import '../../../../layout_screen/presentation/views/widgets/best_offers_horizontal.dart';
import '../../../../layout_screen/presentation/views/widgets/best_offers_section.dart';
import '../../../../layout_screen/presentation/views/widgets/best_trips_section.dart';
import '../../../../layout_screen/presentation/views/widgets/our_blog_section.dart';
import '../../../../layout_screen/presentation/views/widgets/our_partner_section.dart';
import '../../../../layout_screen/presentation/views/widgets/reviews_section.dart';
import '../../../../layout_screen/presentation/views/widgets/top_destination_section.dart';
import '../../../../layout_screen/presentation/views/widgets/we_help_you_section.dart';
import '../../../../layout_screen/presentation/views/widgets/why_choose_us_section.dart';

class CategoriesBottomSection extends StatelessWidget
{
  const CategoriesBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>()..fetchLayoutData(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return state.when(
            initial: ()=> const SizedBox(),
            loading: ()=> const SizedBox(),
            loaded: (layoutModelSectionData)=> Column(
              children: [
                 TopDestinationSection(
                  destinations:layoutModelSectionData.topDestinations ?? [],
                ),
                const CustomSizedBox(),
                 BestOffersSection(
                  bestOffers:layoutModelSectionData.bestOffers ?? [],
                ),
                const CustomSizedBox(),
                 BestTripsSection(
                  bestTrips:layoutModelSectionData.bestTrips?? [],
                ),
                const CustomSizedBox(),
                const PopularExperiencesSection(
                  popularExperiences: [],
                ),
                const CustomSizedBox(),
                OurBlogSection(
                  blogs:layoutModelSectionData.blogs?? [],
                ),
                const CustomSizedBox(),
                 OurPartnerSection(
                  ourPartners:layoutModelSectionData.ourPartners?? [],
                ),
                const CustomSizedBox(),
                const WhyChooseUsSection(),
                const CustomSizedBox(),
                const WeHelpYouSection(),
                CustomActionButton(
                  onTap: () {
                    context.push(AppRoutesString.allTripsScreen);
                  },
                  text:LocaleKeys.Explore_More,
                  height: 70.0.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(12.0.r),
                  backGroundColor: AppColors.orange,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const CustomSizedBox(),
                const BestOffersHorizontal(),
                const CustomSizedBox(),
                 ReviewsSection(
                  reviews:layoutModelSectionData.reviews?? [],
                ),
              ],
            ),
            error:  (errorMessage) => ErrorWidget(
                errorMessage
            ),
          );
        },
      ),
    );
  }
}
