part of 'get_favourite_trips_cubit.dart';

@freezed
class GetFavouriteTripsState with _$GetFavouriteTripsState {
  const factory GetFavouriteTripsState.initial() = _Initial;

  const factory GetFavouriteTripsState.loading() = _Loading;

  const factory GetFavouriteTripsState.loaded(List<Trips> trips) = _Loaded;

  const factory GetFavouriteTripsState.error(String message) = _Error;
}
