import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/layout_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class ExperiencesSections extends StatelessWidget {
  const ExperiencesSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (layoutModel) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    LocaleKeys.Similar_experiences_you.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(
                  height: 215.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: layoutModel.bestTrips!.length,
                    itemBuilder: (context, index) => CustomContainerTrip(
                      width: 225.w,
                      imageName: layoutModel.bestTrips![index].imagePath,
                      cityName: layoutModel.bestTrips![index].name,
                      countryName: layoutModel.bestTrips![index].address,
                      tripPrice: layoutModel.bestTrips![index].adultPrice?.toString(),
                      trip: layoutModel.bestTrips![index],
                      reservationType: '/Person',
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 10.h),
                  child: Text(
                    LocaleKeys.Popular_Experiences.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(
                  height: 215.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: layoutModel.popularExperience!.length,
                    itemBuilder: (context, index) => CustomContainerTrip(
                      width: 140.w,
                      imageName: layoutModel.popularExperience![index].imagePath,
                      cityName: layoutModel.popularExperience![index].name,
                      countryName: layoutModel.popularExperience![index].address,
                      tripPrice: layoutModel.popularExperience![index].adultPrice?.toString(),
                      trip: layoutModel.popularExperience![index],
                      reservationType: '/Person',
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  ),
                ),
              ],
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
