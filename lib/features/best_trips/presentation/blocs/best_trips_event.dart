part of 'best_trips_bloc.dart';

abstract class BestTripsEvent extends Equatable {
  const BestTripsEvent();

  @override
  List<Object?> get props => [];
}

class GetBestTripsEvent extends BestTripsEvent {
  final int? clientId;

  const GetBestTripsEvent({required this.clientId});

  @override
  List<Object?> get props => [clientId];
}
