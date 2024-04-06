import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppStrings.appLogo,
          width: 80.0.w,
          height: 80.0.h,
        ),
        SizedBox(
          width: 25.0.w,
        ),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            var cubit = context.read<MainCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cubit.totalUnPayedBooking} ${cubit.currentCurrency.name.toUpperCase()}",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.0.sp,
                  ),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.Hello.tr(),
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    Text(
                      context.read<MainCubit>().client != null ? context.read<MainCubit>().client!.name.characters.first : 'there',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textAndBackgroundColorButton,
                        fontSize: 16.0.sp,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
