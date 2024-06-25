import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/layout_cubit.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/widgets/row_details.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../cubits/main_cubit/main_cubit.dart';


class LanguageContentSheet extends StatelessWidget {
  const LanguageContentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<LayoutCubit>(),),
      ],
      child: Column(
        children: [
          RowDetails(
            title: LocaleKeys.Arabic.tr(),
            value: 'AR',
            onTap: () async {
              await context.setLocale(const Locale('ar'));
              await getIt<CacheService>().setData(
                key: AppStrings.currentLanguage,
                value: "ar",
              );
              await  getIt<LayoutCubit>().fetchLayoutData(clientId:getIt<MainCubit>().client?.id,);
            },
          ),
          RowDetails(
            title: LocaleKeys.English.tr(),
            value: 'EN',
            onTap: () async {
              await context.setLocale(const Locale('en'));
              await getIt<CacheService>().setData(
                key: AppStrings.currentLanguage,
                value: "en",
              );
              await  getIt<LayoutCubit>().fetchLayoutData(clientId:getIt<MainCubit>().client?.id,);
            },
          ),
          RowDetails(
            title: LocaleKeys.URDU.tr(),
            value: 'UR',
            onTap: () async {
              await context.setLocale(const Locale('ur'));
              await getIt<CacheService>().setData(
                key: AppStrings.currentLanguage,
                value: "ur",
              );
              await getIt<LayoutCubit>().fetchLayoutData(clientId:getIt<MainCubit>().client?.id,);
            },
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
