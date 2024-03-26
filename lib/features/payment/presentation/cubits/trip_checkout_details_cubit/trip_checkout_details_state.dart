part of 'trip_checkout_details_cubit.dart';

@freezed
class TripCheckoutDetailsState with _$TripCheckoutDetailsState {
  const factory TripCheckoutDetailsState.initial() = _Initial;

  const factory TripCheckoutDetailsState.loading() = _Loading;

  const factory TripCheckoutDetailsState.success() = _Success;

  const factory TripCheckoutDetailsState.error(String message) = _Error;
}
