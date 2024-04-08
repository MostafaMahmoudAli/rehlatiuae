part of 'trip_checkout_details_cubit.dart';

@freezed
class TripCheckoutDetailsState with _$TripCheckoutDetailsState {
  const factory TripCheckoutDetailsState.initial() = _Initial;

  const factory TripCheckoutDetailsState.loading() = _Loading;

  const factory TripCheckoutDetailsState.success() = _Success;

  const factory TripCheckoutDetailsState.changeChangeDetails() = _ChangeChangeDetails;

  const factory TripCheckoutDetailsState.error(String message) = _Error;

  const factory TripCheckoutDetailsState.checkedTripLoading() = _CheckedTripLoading;

  const factory TripCheckoutDetailsState.checkedTripSuccess(CheckTripsAndOffersResponse checkTripsAndOffersResponse) = _CheckedTripSuccess;

  const factory TripCheckoutDetailsState.checkedTripError(String errorMessage) = _CheckedTripError;

  const factory TripCheckoutDetailsState.stripeLoading() = _StripeLoading;

  const factory TripCheckoutDetailsState.stripeSuccess() = _StripeSuccess;

  const factory TripCheckoutDetailsState.stripeError(String message) = _StripeError;
}
