part of 'all_destinations_bloc.dart';



abstract class AllDestinationsEvent extends Equatable
{
  const AllDestinationsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllDestinationsEvent extends AllDestinationsEvent{}