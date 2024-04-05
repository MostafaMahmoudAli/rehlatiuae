import 'package:bloc/bloc.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  final AuthRepo authRepo;

  MainCubit({required this.mainRepo, required this.authRepo}) : super(const MainState.initial());
  List<Trips> popularExperience = [];
  List<Trips> bestTrips = [];
  Client? client;
  double totalUnPayedBookingInUSD = 12;
  double? totalUnPayedBooking = 12;
  int currentTab = 0;
  Currency currentCurrency = Currency.usd;
  List<Currency> currencies = [
    Currency.aed,
    Currency.usd,
    Currency.sar,
    Currency.eur,
  ];

  void getCachedClient() {
    _update(const MainState.loading());
    final results = mainRepo.getClient();
    results.fold(
      (errorMessage) => _update(MainState.error(errorMessage)),
      (client) {
        this.client = client;
        _update(const MainState.success());
      },
    );
  }

  Future<void> convert() async {
    _update(const MainState.loading());
    totalUnPayedBooking = await CurrencyConverter.convert(
      from: Currency.usd,
      to: currentCurrency,
      amount: totalUnPayedBookingInUSD,
    );
    _update(const MainState.success());
  }

  void changeCurrentTab(int index) {
    _update(const MainState.loading());
    currentTab = index;
    _update(const MainState.success());
  }

  Future<void> addToFavourite({required int tripId}) async {
    mainRepo.addToFavourite(tripId: tripId);
  }

  Future<void> logout() async {
    _update(const MainState.loading());
    final results = await authRepo.logout();
    results.fold(
      (message) => _update(MainState.error(message)),
      (unit) {
        client = null;
        _update(const MainState.success());
      },
    );
  }

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
