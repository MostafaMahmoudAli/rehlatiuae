import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/custom_circle_avatar.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_body.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_bottom_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/custom_drawer.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import 'package:rehlatyuae/core/utils/search_text_feild.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BestOffersScreen extends StatelessWidget {
  BestOffersScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController bestOffersScrollController = ScrollController();
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
      drawer:const CustomDrawer(),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.0.h,
          horizontal: 17.0.w,
        ),
        child: SingleChildScrollView(
          controller: bestOffersScrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                controller: _textEditingController,
              ),
              const CustomSizedBox(),
              const Text(
                LocaleKeys.Best_Offers,
              ),
              const CustomSizedBox(),
               BestOffersBody(
                bestOffersScrollController: bestOffersScrollController,
              ),
              const CustomSizedBox(),
              const BestOffersBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}


