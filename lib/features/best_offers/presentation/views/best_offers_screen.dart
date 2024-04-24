import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_sized_box.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/best_offers/presentation/blocs/best_offers_bloc.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_body.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/widgets/best_offers_bottom_section.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class BestOffersScreen extends StatelessWidget {
  BestOffersScreen({super.key});

  final ScrollController bestOffersScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>getIt<BestOffersBloc>()
          ..add(
            GetBestOffersEvent(
              clientId: context.read<MainCubit>().client?.id,
            ),
          ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.0.h,
          ),
          child: SingleChildScrollView(
            controller: bestOffersScrollController,
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
                    LocaleKeys.Best_Offers.tr(),
                  ),
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
