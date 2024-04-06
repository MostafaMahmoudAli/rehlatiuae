import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/favourites/presentation/views/widgets/favourites_body.dart';
import 'package:rehlatyuae/features/favourites/presentation/views/widgets/favourites_bottom_section.dart';
import '../../../../core/utils/custom_sized_box.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  final ScrollController scrollFavouritesController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.0.h,
          horizontal: 17.0.w,
        ),
        child: SingleChildScrollView(
          controller: scrollFavouritesController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSizedBox(),
              const Text(
                "My Favorite",
              ),
              const CustomSizedBox(),
              FavouritesBody(
                favouritesScrollController: scrollFavouritesController,
              ),
              const CustomSizedBox(),
              const FavouritesBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
