part of 'popular_experiences_bloc.dart';


enum PopularExperiencesStatus {initial,loading, success,error}

class PopularExperiencesState extends Equatable
{
  final PopularExperiencesStatus status;
  final List<PopularExperiences> popularExperiences;
  final bool hasReachedMax;
  final String errMessage;

  const PopularExperiencesState({
    this.status = PopularExperiencesStatus.loading,
    this.popularExperiences= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  PopularExperiencesState copyWith({
    PopularExperiencesStatus?status,
    List<PopularExperiences>?popularExperiences,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return PopularExperiencesState(
      status:status ?? this.status,
      popularExperiences:popularExperiences??this.popularExperiences,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, popularExperiences, hasReachedMax, errMessage,];
}