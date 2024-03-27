import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_item.dart';

class BestOffersBody extends StatelessWidget {
  const BestOffersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 6 / 2.7,
        mainAxisSpacing: 10.0.h,
      ),
      itemBuilder: (context, index) => BestOffersItem(
        width: 74.0.w, bestOffers: null,

      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
