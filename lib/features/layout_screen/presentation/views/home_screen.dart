import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/popular_experiences.dart';
import 'package:rehlatyuae/core/utils/search_text_feild.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_horizontal.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_trips_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/categories_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/our_blog_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/our_partner_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/reviews_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/top_destination_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/we_help_you_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/why_choose_us_section.dart';

import '../../../../core/utils/custom_dialog.dart';
import '../cubits/layout_cubit.dart';

class HomeScreen extends StatelessWidget
{
  HomeScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>()..fetchLayoutData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (errorMessage) => showDialog(
              context: context,
              builder: (context) => CustomDialog(
                title: errorMessage,
                subtitle: 'Sorry',
                labelText: 'Close',
              ),
            ),
            loaded: (layoutModel) {
              context.read<MainCubit>().bestTrips = layoutModel.bestTrips ?? [];
              context.read<MainCubit>().popularExperience = layoutModel.popularExperience ?? [];
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (layoutModel) => Scaffold(
              body:Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 20.0.h,
                  start:17.0.w ,
                ).copyWith(bottom: 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchTextField(
                        controller: _textEditingController,
                        onTap: () {
                          context.push(
                            AppStrings.searchScreen,
                          );
                        },
                        readOnly: true,

                      ),
                      const CustomSizedBox(),
                      CategoriesSection(
                        categories: layoutModel.categories ?? [],
                      ),
                      const CustomSizedBox(),
                      TopDestinationSection(
                        destinations: layoutModel.topDestinations ?? [],
                      ),
                      const CustomSizedBox(),
                      BestOffersSection(
                        bestOffers: layoutModel.bestOffers ?? [],
                      ),
                      const CustomSizedBox(),
                      BestTripsSection(
                        bestTrips: layoutModel.bestTrips ?? [],
                      ),
                      const CustomSizedBox(),
                      PopularExperiencesSection(
                        popularExperiences: layoutModel.popularExperience ?? [],
                      ),
                      const CustomSizedBox(),
                      OurBlogSection(
                        blogs: layoutModel.blogs ?? [],
                      ),
                      const CustomSizedBox(),
                      OurPartnerSection(
                        ourPartners: layoutModel.ourPartners ?? [],
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
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const CustomSizedBox(),
                      const BestOffersHorizontal(),
                      const CustomSizedBox(),
                      ReviewsSection(
                        reviews: layoutModel.reviews ?? [],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
