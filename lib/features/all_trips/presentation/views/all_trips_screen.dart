import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/all_trips/presentation/blocs/all_trips_bloc.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/all_trips_body.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/widgets/all_trips_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class AllTripsScreen extends StatelessWidget {
  AllTripsScreen({super.key});

  final ScrollController allTripsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<AllTripsBloc>()..add(GetAllTripsEvent()),
        child: SingleChildScrollView(
          controller: allTripsScrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsetsDirectional.symmetric(horizontal:15.0.w,),
                child: Text(
                  LocaleKeys.All_Trip.tr(),
                ),
              ),
              const CustomSizedBox(),
              AllTripsBody(
                allTripsScrollController: allTripsScrollController,
              ),
              const CustomSizedBox(),
              const AllTripsBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}

