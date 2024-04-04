import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/features/best_offers/data/models/images_model.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class PreviewTravelsSection extends StatelessWidget {
  final bool hasBookButton;
  final List<ImagesModel>? images;

  const PreviewTravelsSection({
    this.hasBookButton = true,
    this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.Preview.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFFF6F8FA),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "4,8",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: images!.length,
            itemBuilder: (context, index) => InkWell(
              // onTap: () {
              //   MultiImageProvider multiImageProvider = MultiImageProvider(
              //     images!
              //         .map(
              //           (e) => CachedNetworkImageProvider(
              //             e.imagePath,
              //           ),
              //         )
              //         .toList(),
              //   );
              //   showImageViewerPager(context, multiImageProvider);
              // },
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      images![index].imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
        if (hasBookButton)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            child: CustomActionButton(
              text: LocaleKeys.Book_Now.tr(),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: AppColors.textAndBackgroundColorButton,
              onTap: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                context.push(AppRoutesString.paymentOptionsScreen);
              },
              width: double.infinity,
              height: 50.h,
            ),
          ),
      ],
    );
  }
}
