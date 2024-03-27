import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_circle_avatar.dart';
import '../../../../core/utils/custom_sized_box.dart';
import '../../../../core/utils/popular_experiences.dart';
import '../../../all_categories/presentation/views/widgets/category_name_body.dart';
import '../../../layout_screen/presentation/views/custom_drawer.dart';
import '../../../layout_screen/presentation/views/widgets/best_offers_horizontal.dart';
import '../../../layout_screen/presentation/views/widgets/best_offers_section.dart';
import '../../../layout_screen/presentation/views/widgets/best_trips_section.dart';
import '../../../layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import '../../../layout_screen/presentation/views/widgets/our_blog_section.dart';
import '../../../layout_screen/presentation/views/widgets/our_partner_section.dart';
import '../../../layout_screen/presentation/views/widgets/reviews_section.dart';
import '../../../../core/utils/search_text_feild.dart';
import '../../../layout_screen/presentation/views/widgets/we_help_you_section.dart';
import '../../../layout_screen/presentation/views/widgets/why_choose_us_section.dart';

class CityDestinationScreen extends StatelessWidget
{
   CityDestinationScreen({super.key});
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.whiteAppColor,
        title: const CustomAppBarTitle(),
        actions: [
          InkWell(
            onTap: () {},
            child: CustomCircleAvatar(
              radius: 40.0.r,
              backgroundImage: const AssetImage(
                "assets/images/Ellipse 1.png",
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.0.h,
          horizontal: 17.0.w,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                controller: _textEditingController,
              ),
              const CustomSizedBox(),
              const Text(
                AppStrings.cityDestinationTitle,
              ),
              const CustomSizedBox(),
              const CategoryNameBody(),
              const CustomSizedBox(),
              const BestOffersSection(bestOffers: [],),
              const CustomSizedBox(),
              const BestTripsSection(),
              const CustomSizedBox(),
              const PopularExperiencesSection(),
              const CustomSizedBox(),
              const OurBlogSection(),
              const CustomSizedBox(),
              const OurPartnerSection(),
              const CustomSizedBox(),
              const WhyChooseUsSection(),
              const CustomSizedBox(),
              const WeHelpYouSection(),
              CustomActionButton(
                onTap: ()
                {
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
              const ReviewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
