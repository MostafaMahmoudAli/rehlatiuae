import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_item.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_row_title.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import '../../../../../core/utils/whats_up_botton.dart';
import '../../../../best_offers/data/models/best_offers_model.dart';

class BestOffersSection extends StatelessWidget {
  const BestOffersSection({
    super.key,
    required this.bestOffers,
  });

  final List<BestOffers> bestOffers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowTitle(
          text: LocaleKeys.Best_Offers.tr(),
          onPressed: () {
            context.push(AppRoutesString.bestOffersScreen);
          },
        ),
        Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return BestOffersItem(
                  width: 74.0.w,
                  bestOffers: bestOffers[index],
                  // review:bestOffers[index].reviews != null? bestOffers[index].reviews![index] : [][index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.0.h,
                );
              },
              itemCount: bestOffers.length,
            ),
            WhatsUpButton(
              onTap: (){},
              bottom:MediaQuery.sizeOf(context).height*0.16,
              right: 0,
            ),

          ],
        ),
      ],
    );
  }
}
