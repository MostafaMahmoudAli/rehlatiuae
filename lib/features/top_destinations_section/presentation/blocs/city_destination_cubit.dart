import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/city_destination_model.dart';
import '../../domian/repositories/city_destination_repo.dart';

part 'city_destination_cubit.freezed.dart';
part 'city_destination_state.dart';

class CityDestinationCubit extends Cubit<CityDestinationState> {
  final CityDestinationRepo cityDestinationRepo;

  CityDestinationCubit({
    required this.cityDestinationRepo,
  }) : super(const CityDestinationState.initial());

  Future<void> fetchCityDestinations({
    required int? destinationId,
    int? clientId,
  }) async {
    emit(const CityDestinationState.loading());
    var results = await cityDestinationRepo.fetchCityDestinations(
      destinationId: destinationId,
      clientId: clientId,
    );

    results.fold(
      (errorMessage) => emit(CityDestinationState.error(errorMessage)),
      (cityDestination) => emit(CityDestinationState.loaded(cityDestination)),
    );
  }
}
