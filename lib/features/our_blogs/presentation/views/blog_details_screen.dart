import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/bolg_travel_title_section.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/experiences_section.dart';
import 'package:rehlatyuae/core/utils/preview_travels_section.dart';
import 'package:rehlatyuae/core/utils/ratings_reviews_section.dart';
import 'package:rehlatyuae/features/our_blogs/data/models/blogs_model.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/paragraph_section.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BlogDetailsScreen extends StatefulWidget {
  final Blogs blogs;

  const BlogDetailsScreen({super.key, required this.blogs});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  int totalRating = 0;
  double aveRating = 0;

  @override
  Widget build(BuildContext context) {
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
          ...List.generate(
            widget.blogs.addresses!.length,
            (index) => ParagraphSection(
              title: widget.blogs.addresses![index].name,
              subTitle: widget.blogs.addresses![index].description,
            ),
          ),
          if (widget.blogs.attachments!.isNotEmpty)
            PreviewTravelsSection(
              images: widget.blogs.attachments![0].images,
              aveRating: aveRating,
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            child: CustomActionButton(
              text: LocaleKeys.Book_Now.tr(),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: AppColors.textAndBackgroundColorButton,
              onTap: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                var cubit = context.read<TripCheckoutDetailsCubit>();
                cubit.selectedTrip = widget.blogs.trip;
                context.push(AppRoutesString.paymentOptionsScreen).then(
                      (value) => cubit.onClosePaymentOptionsScreen(),
                    );
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
            totalRating: totalRating,
            aveRating: aveRating,
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
    totalRating = (widget.blogs.reviewCount?.oneStar ?? 0) +
        (widget.blogs.reviewCount?.towStar ?? 0) +
        (widget.blogs.reviewCount?.threeStar ?? 0) +
        (widget.blogs.reviewCount?.fourStar ?? 0) +
        (widget.blogs.reviewCount?.fiveStar ?? 0);

    aveRating = 0;
    if (totalRating != 0) {
      aveRating = ((widget.blogs.reviewCount?.oneStar ?? 0) +
              (widget.blogs.reviewCount?.towStar ?? 0 * 2) +
              (widget.blogs.reviewCount?.threeStar ?? 0 * 3) +
              (widget.blogs.reviewCount?.fourStar ?? 0 * 4) +
              (widget.blogs.reviewCount?.fiveStar ?? 0 * 5)) /
          totalRating;
      super.initState();
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
