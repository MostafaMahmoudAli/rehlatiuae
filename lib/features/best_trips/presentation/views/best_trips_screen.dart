import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/widgets/best_trips_body.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/widgets/best_trips_bottom_section.dart';
import '../../../../core/utils/injector.dart';
import '../blocs/best_trips_bloc.dart';

class BestTripsScreen extends StatelessWidget {
  BestTripsScreen({super.key});

  final ScrollController bestTripsScrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<BestTripsBloc>()..add(GetBestTripsEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            controller: bestTripsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                const Text(
                  AppStrings.bestTripsTitle,
                ),
                const CustomSizedBox(),
                BestTripsBody(bestTripsScrollController: bestTripsScrollController,),
                const CustomSizedBox(),
                const BestTripsBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

