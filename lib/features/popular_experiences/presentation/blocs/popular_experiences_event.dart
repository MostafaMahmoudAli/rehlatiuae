part of 'popular_experiences_bloc.dart';


abstract class PopularExperiencesEvent extends Equatable
{
  const PopularExperiencesEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularExperiencesEvent extends PopularExperiencesEvent{}