part of 'best_trips_bloc.dart';



enum BestTripsStatus {initial,loading, success, error}

class BestTripsState extends Equatable
{
  final BestTripsStatus status;
  final List<BestTrips> bestTrips;
  final bool hasReachedMax;
  final String errMessage;

  const BestTripsState({
    this.status = BestTripsStatus.loading,
    this.bestTrips= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  BestTripsState copyWith({
    BestTripsStatus?status,
    List<BestTrips>?bestTrips,
    bool?hasReachedMax,
    String?errMessage,
  }) {
    return BestTripsState(
      status:status ?? this.status,
      bestTrips:bestTrips??this.bestTrips,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, bestTrips, hasReachedMax, errMessage];
}