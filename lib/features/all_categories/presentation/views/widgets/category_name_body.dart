import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/features/all_categories/presentation/blocs/category_name_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

import '../../../../../core/utils/custom_container_trip.dart';
import '../../../../../core/utils/custom_dialog.dart';

class CategoryNameBody extends StatelessWidget {
  const CategoryNameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryNameCubit, CategoryNameState>(
      listener: (context, state) {
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
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (categoryNameTrips) => Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal: 18.0.w,),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0.w,
                mainAxisSpacing: 15.0.w,
                childAspectRatio: MediaQuery.sizeOf(context).aspectRatio / 0.6,
              ),
              itemBuilder: (context, index) => CustomContainerTrip(
                width: 200.0.w,
                cityName: categoryNameTrips[index].name ?? "",
                countryName: categoryNameTrips[index].description ?? "",
                imageName: categoryNameTrips[index].imagePath ?? "",
                tripPrice: categoryNameTrips[index].adultPrice.toString(),
                reservationType: "/person",
                trip: categoryNameTrips[index],
              ),
              itemCount: categoryNameTrips.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
