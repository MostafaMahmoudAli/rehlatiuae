import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/favourites/presentation/views/widgets/favourites_body.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  final ScrollController scrollFavouritesController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favorite",
        ),
      ),
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
              FavouritesBody(
                favouritesScrollController: scrollFavouritesController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
