part of 'city_destination_cubit.dart';

@freezed
class CityDestinationState with _$CityDestinationState {
  const factory CityDestinationState.initial() = _Initial;
  const factory CityDestinationState.loading() = _Loading;
  const factory CityDestinationState.loaded(CityDestination cityDestination) = _Loaded;
  const factory CityDestinationState.error(String errorMessage) = _Error;
}
