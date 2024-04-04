import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/our_blogs/data/models/blogs_model.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/paragraph_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BlogDetailsScreen extends StatefulWidget {
  final Blogs blogs;

  const BlogDetailsScreen({super.key, required this.blogs});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    getIt<Logger>().w(widget.blogs);
    return Scaffold(
      body: ListView(
        children: [
          BolgTravelTitleSection(
            title: widget.blogs.name ?? '',
            address: widget.blogs.trip?.address ?? '',
            price: widget.blogs.createdAt.toString(),
            imagePath: widget.blogs.imagePath ?? '',
            isTrip: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Text(
              widget.blogs.description ?? '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ),
          ParagraphSection(title: LocaleKeys.Exciting_Activities_at.tr(), subTitle: LocaleKeys.The_mighty.tr()),
          // const PreviewTravelsSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            child: CustomActionButton(
              text: LocaleKeys.Book_Now.tr(),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: AppColors.textAndBackgroundColorButton,
              onTap: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                context.push(AppRoutesString.paymentOptionsScreen, extra: widget.blogs.trip);
              },
              width: double.infinity,
              height: 50.h,
            ),
          ),
          RatingsReviewsSection(
            reviews: widget.blogs.blogReview,
            id: widget.blogs.id,
            reviewsCount: widget.blogs.reviewCount,
            isTrip: false,
          ),
          const ExperiencesSections(),
        ],
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
