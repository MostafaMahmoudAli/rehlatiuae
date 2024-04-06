import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/widgets/all_destination_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../blocs/all_destinations_bloc.dart';
import 'widgets/all_destination_body.dart';

class TopDestinationScreen extends StatelessWidget {
  TopDestinationScreen({super.key});

  final ScrollController allDestinationsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            getIt<AllDestinationsBloc>()..add(GetAllDestinationsEvent()),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 10.0.h,
          ),
          child: SingleChildScrollView(
            controller: allDestinationsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(
                    start: 12.0.w,
                    end: 12.0.w,
                    bottom:20.0.h,
                    top: 20.0.h,
                  ),
                  child: Text(
                    LocaleKeys.All_Destinations.tr(),
                  ),
                ),
                AllDestinationBody(
                  allDestinationsScrollController:
                      allDestinationsScrollController,
                ),
                const AllDestinationBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
