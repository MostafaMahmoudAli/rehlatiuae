part of 'all_destinations_bloc.dart';




enum AllDestinationsStatus {initial,loading, success,error}

class AllDestinationsState extends Equatable
{
  final AllDestinationsStatus status;
  final List<AllDestinations> allDestination;
  final bool hasReachedMax;
  final String errMessage;

  const AllDestinationsState({
    this.status = AllDestinationsStatus.loading,
    this.allDestination= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  AllDestinationsState copyWith({
    AllDestinationsStatus?status,
    List<AllDestinations>?allDestination,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return AllDestinationsState(
      status:status ?? this.status,
      allDestination:allDestination??this.allDestination,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, allDestination, hasReachedMax, errMessage,];
}