import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class ExperiencesSections extends StatelessWidget {
  const ExperiencesSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: context.read<MainCubit>().bestTrips.length,
            itemBuilder: (context, index) => CustomContainerTrip(
              width: 225.w,
              imageName: context.read<MainCubit>().bestTrips[index].imagePath,
              cityName: context.read<MainCubit>().bestTrips[index].name,
              countryName: context.read<MainCubit>().bestTrips[index].address,
              tripPrice: context.read<MainCubit>().bestTrips[index].adultPrice?.toString(),
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
            itemCount: context.read<MainCubit>().popularExperience.length,
            itemBuilder: (context, index) => CustomContainerTrip(
              width: 140.w,
              imageName: context.read<MainCubit>().popularExperience[index].imagePath,
              cityName: context.read<MainCubit>().popularExperience[index].name,
              countryName: context.read<MainCubit>().popularExperience[index].address,
              tripPrice: context.read<MainCubit>().popularExperience[index].adultPrice?.toString(),
              reservationType: '/Person',
            ),
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
          ),
        ),
      ],
    );
  }
}
