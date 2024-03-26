import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/best_offers_horizontal_item.dart';

class BestOffersHorizontal extends StatelessWidget {
  const BestOffersHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130.0.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BestOffersHorizontalItem(
                width: 70.0.w,
              );
            },
            itemCount: 5,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 8.0.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
