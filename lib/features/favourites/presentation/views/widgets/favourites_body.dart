import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/custom_container_trip.dart';
import 'package:rehlatyuae/core/utils/custom_dialog.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/favourites/presentation/cubits/get_favourite_trips_cubit.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key, required this.favouritesScrollController});

  final ScrollController favouritesScrollController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetFavouriteTripsCubit>()..getFavouriteTrips(),
      child: BlocConsumer<GetFavouriteTripsCubit, GetFavouriteTripsState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  title: message,
                  subtitle: 'Sorry',
                  labelText: 'Close',
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0.w,
                mainAxisSpacing: 15.0.w,
                mainAxisExtent: 170.0.h,
                childAspectRatio: 7 / 6.6,
              ),
              itemBuilder: (context, index) => CustomContainerTrip(
                width: 200.0.w,
                trip: trips[index],
                cityName: trips[index].address,
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
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
