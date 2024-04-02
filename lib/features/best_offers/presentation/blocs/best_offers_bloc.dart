import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../domain/repositories/best_offers_repo.dart';

part 'best_offers_event.dart';
part 'best_offers_state.dart';

class BestOffersBloc extends Bloc<BestOffersEvent, BestOffersState> {
  final BestOffersRepo bestOffersRepo;
  BestOffersBloc({required this.bestOffersRepo}) : super(const BestOffersState()) {
    on<BestOffersEvent>((event, emit) async{
    if(event is GetBestOffersEvent)
    {
      if (state.hasReachedMax == true) {
        return;
      }
      if (state.status == BestOffersStatus.loading) {
        var results = await bestOffersRepo.fetchBestOffers();
        results.fold(
              (errorMessage) => emit(
            state.copyWith(
              status: BestOffersStatus.error,
              errMessage: errorMessage,
            ),
          ),
              (bestOffers) => emit(
            state.copyWith(
              status: BestOffersStatus.success,
              bestOffers: bestOffers,
              hasReachedMax: false,
            ),
          ),
        );
      } else {
        var results = await bestOffersRepo.fetchBestOffers(
            startIndex: state.bestOffers.length);
        results.fold(
              (errorMessage) => emit(
            state.copyWith(
              status: BestOffersStatus.error,
              errMessage: errorMessage,
            ),
          ),
              (bestOffers) {
                bestOffers.isEmpty ? emit(state.copyWith(hasReachedMax: true))
                :
            emit(state.copyWith(
              status: BestOffersStatus.success,
              bestOffers: List.of(state.bestOffers)..addAll(bestOffers),
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
