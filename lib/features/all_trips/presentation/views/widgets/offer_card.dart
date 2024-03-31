import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_button.dart';
import 'package:rehlatyuae/core/utils/default_text_button.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/offer_details_screen.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/offer_count_tickets_section.dart';

class OfferCard extends StatelessWidget {
  final Trips offer;

  const OfferCard({
    required this.offer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            offer.imagePath!,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ).copyWith(top: 15.h),
                    child: SizedBox(
                      width: 150.w,
                      child: Text(
                        offer.name!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$${offer.adultPrice}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      ' /Person',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.sp),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                OfferCountTicketsSection(
                  adultCost: offer.adultPrice!.toDouble(),
                  childCost: offer.childPrice!.toDouble(),
                  onChildrenCountChange: (count, total) {},
                  onAdultsCountChange: (count, total) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomActionButton(
                        text: 'select',
                        borderRadius: BorderRadius.circular(15.sp),
                        backGroundColor: AppColors.textAndBackgroundColorButton,
                        onTap: () {},
                        width: 100.w,
                        height: 50.h,
                      ),
                      DefaultTextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            builder: (context) => const OfferDetailsScreen(),
                          );
                        },
                        text: 'view',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
