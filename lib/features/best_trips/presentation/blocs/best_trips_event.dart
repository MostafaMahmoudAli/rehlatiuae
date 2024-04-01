part of 'best_trips_bloc.dart';

abstract class BestTripsEvent extends Equatable
{
  const BestTripsEvent();

  @override
  List<Object?> get props => [];
}

class GetBestTripsEvent extends BestTripsEvent{}