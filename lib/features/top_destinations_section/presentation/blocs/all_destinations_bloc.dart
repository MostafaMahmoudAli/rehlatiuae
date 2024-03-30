import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/all_destination_model.dart';
import '../../domian/repositories/all_destinations_repo.dart';
part 'all_destinations_event.dart';
part 'all_destinations_state.dart';

class AllDestinationsBloc extends Bloc<AllDestinationsEvent, AllDestinationsState> {
  final ALLDestinationsRepo allDestinationsRepo;
  AllDestinationsBloc({required this.allDestinationsRepo}) : super(const AllDestinationsState()) {
    on<AllDestinationsEvent>((event, emit) async{
      if (event is GetAllDestinationsEvent) {
        if (state.hasReachedMax == true) {
          return;
        }
        if (state.status == AllDestinationsStatus.loading) {
          var results = await allDestinationsRepo.fetchAllDestinations();
          results.fold(
                (errorMessage) => emit(
              state.copyWith(
                status: AllDestinationsStatus.error,
                errMessage: errorMessage,
              ),
            ),
                (allDestination) => emit(
              state.copyWith(
                status: AllDestinationsStatus.success,
                allDestination: allDestination,
                hasReachedMax: false,
              ),
            ),
          );
        } else {
          var results = await allDestinationsRepo.fetchAllDestinations(
              startIndex: state.allDestination.length);
          results.fold(
                (errorMessage) => emit(
              state.copyWith(
                status: AllDestinationsStatus.error,
                errMessage: errorMessage,
              ),
            ),
                (allDestination) {
                  allDestination.isEmpty ? emit(state.copyWith(hasReachedMax: true))
                  :
              emit(state.copyWith(
                status: AllDestinationsStatus.success,
                allDestination: List.of(state.allDestination)..addAll(allDestination),
                hasReachedMax: false,
              ),
              );
            },
          );
        }
      }
    },
      transformer:droppable(),
    );
  }
}
