import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/trips_model.dart';
import '../../domain/repositories/trips_repository.dart';

part 'all_trips_event.dart';
part 'all_trips_state.dart';

class AllTripsBloc extends Bloc<AllTripsEvent, AllTripsState> {
  final AllTripsRepository allTripsRepository;

  AllTripsBloc({required this.allTripsRepository}) : super(const AllTripsState()) {
    on<AllTripsEvent>(
      (event, emit) async {
        if (event is GetAllTripsEvent) {
          if (state.hasReachedMax == true) {
            return;
          }
          if (state.status == AllTripsStatus.loading) {
            var results = await allTripsRepository.fetchAllTrips(
              clientId: event.clientId,
            );
            results.fold(
              (errorMessage) => _update(
                state.copyWith(
                  status: AllTripsStatus.error,
                  errMessage: errorMessage,
                ),
              ),
              (trips) => _update(
                state.copyWith(
                  status: AllTripsStatus.success,
                  trips: trips,
                  hasReachedMax: false,
                ),
              ),
            );
          } else {
            var results = await allTripsRepository.fetchAllTrips(
              startIndex: state.trips.length,
              clientId: event.clientId,
            );

            results.fold(
              (errorMessage) => _update(
                state.copyWith(
                  status: AllTripsStatus.error,
                  errMessage: errorMessage,
                ),
              ),
              (trips) {
                trips.isEmpty
                    ? _update(state.copyWith(hasReachedMax: true))
                    : _update(
                        state.copyWith(
                          status: AllTripsStatus.success,
                          trips: List.of(state.trips)..addAll(trips),
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

  void _update(AllTripsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
