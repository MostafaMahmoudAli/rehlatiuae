import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/widgets/all_destination_bottom_section.dart';
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
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            controller: allDestinationsScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                const Text(
                  AppStrings.topDestinationTitle,
                ),
                AllDestinationBody(
                    allDestinationsScrollController: allDestinationsScrollController,
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
