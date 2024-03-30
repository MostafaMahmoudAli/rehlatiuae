part of 'all_trips_bloc.dart';




enum AllTripsStatus {initial,loading, success, error}

class AllTripsState extends Equatable
{
  final AllTripsStatus status;
  final List<Trips> trips;
  final bool hasReachedMax;
  final String errMessage;

  const AllTripsState({
    this.status = AllTripsStatus.loading,
    this.trips= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  AllTripsState copyWith({
    AllTripsStatus?status,
    List<Trips>?trips,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return AllTripsState(
      status:status ?? this.status,
      trips:trips??this.trips,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, trips, hasReachedMax, errMessage];
}