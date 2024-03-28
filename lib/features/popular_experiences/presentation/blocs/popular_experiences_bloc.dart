import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/popular_experiences_model.dart';
import '../../domain/repositories/popular_experiences_repo.dart';

part 'popular_experiences_event.dart';
part 'popular_experiences_state.dart';

class PopularExperiencesBloc extends Bloc<PopularExperiencesEvent, PopularExperiencesState> {
  final PopularExperiencesRepo popularExperiencesRepo;
  PopularExperiencesBloc({required this.popularExperiencesRepo}) : super(const PopularExperiencesState()) {
    on<PopularExperiencesEvent>((event, emit) async{
      if (event is GetPopularExperiencesEvent) {
        if (state.hasReachedMax == true) {
          return;
        }
        if (state.status == PopularExperiencesStatus.loading) {
          var results = await popularExperiencesRepo.fetchPopularExperiences();
          results.fold(
                (errorMessage) => emit(
              state.copyWith(
                status: PopularExperiencesStatus.error,
                errMessage: errorMessage,
              ),
            ),
                (popularExperiences) => emit(
              state.copyWith(
                status: PopularExperiencesStatus.success,
                popularExperiences: popularExperiences,
                hasReachedMax: false,
              ),
            ),
          );
        } else {
          var results = await popularExperiencesRepo.fetchPopularExperiences(
              startIndex: state.popularExperiences.length);
          results.fold(
                (errorMessage) => emit(
              state.copyWith(
                status: PopularExperiencesStatus.error,
                errMessage: errorMessage,
              ),
            ),
                (popularExperiences) {
                  popularExperiences.isEmpty ? emit(state.copyWith(hasReachedMax: true))
                  :
              emit(state.copyWith(
                status: PopularExperiencesStatus.success,
                popularExperiences: List.of(state.popularExperiences)..addAll(popularExperiences),
                hasReachedMax: false,
              ),
              );
            },
          );
        }
      }
    },
      transformer: droppable(),
    );
  }
}
