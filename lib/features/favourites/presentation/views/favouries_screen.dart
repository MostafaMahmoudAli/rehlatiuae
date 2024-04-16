import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/favourites/presentation/cubits/get_favourite_trips_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/generated/locale_keys.g.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.My_Favorite.tr(),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<GetFavouriteTripsCubit>()
          ..getFavouriteTrips(
            clientId: context.read<MainCubit>().client!.id,
          ),
        child: BlocConsumer<GetFavouriteTripsCubit, GetFavouriteTripsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: message,
                    subtitle: LocaleKeys.Sorry.tr(),
                    labelText: LocaleKeys.Close.tr(),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 300.h,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loaded: (trips) => GridView.builder(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 20.0.h,
                  horizontal: 17.0.w,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0.w,
                  mainAxisSpacing: 15.0.w,
                  mainAxisExtent: 200.0.h,
                  childAspectRatio: 7 / 6.6,
                ),
                itemBuilder: (context, index) => CustomContainerTrip(
                  width: 200.0.w,
                  trip: trips[index],
                  cityName: trips[index].name,
                  countryName: trips[index].address,
                  imageName: trips[index].imagePath,
                  tripPrice: trips[index].adultPrice.toString(),
                  reservationType: "/person",
                  isFavorite: true,
                  onTapFavoriteIcon: () {
                    context.read<GetFavouriteTripsCubit>().removeTripFromFavourite(
                          trips: trips,
                          index: index,
                        );
                  },
                ),
                itemCount: trips.length,
                physics: const ClampingScrollPhysics(),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
