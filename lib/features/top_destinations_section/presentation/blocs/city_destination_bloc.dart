import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_destination_event.dart';
part 'city_destination_state.dart';

class CityDestinationBloc extends Bloc<CityDestinationEvent, CityDestinationState> {
  CityDestinationBloc() : super(CityDestinationInitial()) {
    on<CityDestinationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
