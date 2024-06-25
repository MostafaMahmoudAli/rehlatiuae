import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/favourites/domain/repositories/favourites_repo.dart';

part 'get_favourite_trips_cubit.freezed.dart';
part 'get_favourite_trips_state.dart';

class GetFavouriteTripsCubit extends Cubit<GetFavouriteTripsState> {
  FavouritesRepo favouritesRepo;

  GetFavouriteTripsCubit({required this.favouritesRepo}) : super(const GetFavouriteTripsState.initial());

  Future<void> getFavouriteTrips({required int clientId}) async {
    _update(const GetFavouriteTripsState.loading());
    final results = await favouritesRepo.getFavouriteTrips(clientId: clientId);
    results.fold(
      (error) => _update(GetFavouriteTripsState.error(error)),
      (trips) => _update(GetFavouriteTripsState.loaded(trips)),
    );
  }

  void removeTripFromFavourite({required List<Trips> trips, required int index}) {
    _update(const GetFavouriteTripsState.loading());

    List<Trips> tempTrips = trips.where((element) => element.id != trips[index].id).toList();
    _update(GetFavouriteTripsState.loaded(tempTrips));
  }

  void _update(GetFavouriteTripsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
