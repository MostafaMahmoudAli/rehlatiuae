import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_assets.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/paragraph_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const BolgTravelTitleSection(
            title: LocaleKeys.Blog_name,
            address: LocaleKeys.Dubai_United,
            price: "79",
            imagePath: AppAssets.travel,
            isTrip: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              LocaleKeys.The_mighty,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          const ParagraphSection(
            title: LocaleKeys.Exciting_Activities_at,
            subTitle:
           LocaleKeys.The_mighty        
            ),
          const ParagraphSection(
            title: LocaleKeys.KIDS_ADVENTURE,
            subTitle:
            LocaleKeys.The_mighty   
           ),
          const ParagraphSection(
            title: LocaleKeys.ARABIAN_VILLAGE,
            subTitle:
            LocaleKeys.The_mighty    
            ),
          const PreviewTravelsSection(),
          const RatingsReviewsSection(),
          const ExperiencesSections(),
        ],
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
