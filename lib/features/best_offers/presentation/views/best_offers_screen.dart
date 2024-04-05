
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_body.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_bottom_section.dart';
import '../blocs/best_offers_bloc.dart';

class BestOffersScreen extends StatelessWidget {
  BestOffersScreen({super.key});

  final ScrollController bestOffersScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: BlocProvider(
        create:(context)=>getIt<BestOffersBloc>()..add(GetBestOffersEvent()),
        child: Padding(
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
                const CustomSizedBox(),
                const Text(
                  AppStrings.bestOffersTitle,
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
      ),
    );
  }
}



