part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;

  const factory BookingState.loading() = _Loading;

  const factory BookingState.success(List<CartTrips> bookings) = _Success;

  const factory BookingState.error(String message) = _Error;
}
