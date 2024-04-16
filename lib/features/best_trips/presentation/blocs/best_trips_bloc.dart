import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../domian/repositories/best_trips_repo.dart';

part 'best_trips_event.dart';

part 'best_trips_state.dart';

class BestTripsBloc extends Bloc<BestTripsEvent, BestTripsState> {
  final BestTripsRepo bestTripsRepo;

  BestTripsBloc({required this.bestTripsRepo}) : super(const BestTripsState()) {
    on<BestTripsEvent>(
      (event, emit) async {
        if (event is GetBestTripsEvent) {
          if (state.hasReachedMax == true) {
            return;
          }
          if (state.status == BestTripsStatus.loading) {
            var results = await bestTripsRepo.fetchBestTrips(
              clientId: event.clientId,
            );
            results.fold(
              (errorMessage) => emit(
                state.copyWith(
                  status: BestTripsStatus.error,
                  errMessage: errorMessage,
                ),
              ),
              (bestTrips) => emit(
                state.copyWith(
                  status: BestTripsStatus.success,
                  bestTrips: bestTrips,
                  hasReachedMax: false,
                ),
              ),
            );
          } else {
            var results = await bestTripsRepo.fetchBestTrips(
              startIndex: state.bestTrips.length,
              clientId: event.clientId,
            );
            results.fold(
              (errorMessage) => emit(
                state.copyWith(
                  status: BestTripsStatus.error,
                  errMessage: errorMessage,
                ),
              ),
              (bestTrips) {
                bestTrips.isEmpty
                    ? emit(state.copyWith(hasReachedMax: true))
                    : emit(
                        state.copyWith(
                          status: BestTripsStatus.success,
                          bestTrips: List.of(state.bestTrips)..addAll(bestTrips),
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
