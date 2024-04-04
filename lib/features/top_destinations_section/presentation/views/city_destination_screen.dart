import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/widgets/city_destination_body.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/widgets/city_destination_bottom_section.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_circle_avatar.dart';
import '../../../../core/utils/custom_dialog.dart';
import '../../../../core/utils/custom_sized_box.dart';
import '../../../../core/utils/injector.dart';
import '../../../layout_screen/presentation/views/custom_drawer.dart';
import '../../../layout_screen/presentation/views/widgets/custom_app_bar_title.dart';
import '../blocs/city_destination_cubit.dart';

class CityDestinationScreen extends StatelessWidget {
  CityDestinationScreen({super.key, required this.cityDestinationId});

  final ScrollController cityDestinationScrollController = ScrollController();
  final int cityDestinationId;

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
      drawer: const CustomDrawer(),
      body: BlocProvider(
        create: (context) => getIt<CityDestinationCubit>()..fetchCityDestinations(destinationId: cityDestinationId),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
            horizontal: 17.0.w,
          ),
          child: SingleChildScrollView(
            controller: cityDestinationScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<CityDestinationCubit, CityDestinationState>(listener: (context, state) {
                  state.whenOrNull(
                    error: (errorMessage) => showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: errorMessage,
                        subtitle: LocaleKeys.Sorry.tr(),
                        labelText: LocaleKeys.Close.tr(),
                      ),
                    ),
                  );
                }, builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (cityDestination) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityDestination.name ?? "",
                        ),
                        const CustomSizedBox(),
                        CityDestinationBody(
                          cityDestination: cityDestination,
                        ),
                      ],
                    ),
                    orElse: () => const SizedBox(),
                  );
                }),
                const CustomSizedBox(),
                const CityDestinationBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
