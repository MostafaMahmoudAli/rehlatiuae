import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/widgets/best_trips_body.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/widgets/best_trips_bottom_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/injector.dart';
import '../blocs/best_trips_bloc.dart';

class BestTripsScreen extends StatelessWidget {
  BestTripsScreen({super.key});

  final ScrollController bestTripsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BestTripsBloc>()
        ..add(
          GetBestTripsEvent(
            clientId: context.read<MainCubit>().client?.id,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
          ),
          child: SingleChildScrollView(
            controller: bestTripsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 12.0.w,
                    end: 12.0.w,
                    bottom: 10.0.h,
                    top: 10.0.h,
                  ),
                  child: Text(
                    LocaleKeys.Best_Trips.tr(),
                  ),
                ),
                const CustomSizedBox(),
                BestTripsBody(
                  bestTripsScrollController: bestTripsScrollController,
                ),
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
