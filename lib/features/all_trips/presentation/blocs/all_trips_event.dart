part of 'all_trips_bloc.dart';



abstract class AllTripsEvent extends Equatable
{
  const AllTripsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllTripsEvent extends AllTripsEvent{}
