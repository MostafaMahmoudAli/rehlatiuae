import 'package:bloc/bloc.dart';
import 'package:currency_converter/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';
import 'package:url_launcher/url_launcher.dart';

part 'main_cubit.freezed.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  final AuthRepo authRepo;

  MainCubit({required this.mainRepo, required this.authRepo}) : super(const MainState.initial());
  Client? client;
  double totalUnPayedBookingInUSD = 1;
  double? totalUnPayedBooking = 1;
  double? currentCurrencyPrice = 1;
  int currentTab = 0;
  Currency currentCurrency = Currency.usd;
  List<Currency> currencies = [
    Currency.aed,
    Currency.usd,
    Currency.sar,
    Currency.eur,
  ];

  Future<void> initMain() async {
    _update(const MainState.loading());
    getCachedClient();
    getCurrentCurrency();
    await getPriceCurrency();
    _update(const MainState.success());
  }

  void getCachedClient() {
    final results = mainRepo.getClient();
    results.fold(
          (errorMessage) => _update(MainState.error(errorMessage)),
          (client) => this.client = client,
    );
  }

  void getCurrentCurrency() {
    final results = mainRepo.getCurrentCurrencyAndTotalUnPaid();
    results.fold(
          (errorMessage) => _update(MainState.error(errorMessage)),
          (currentAndTotal) {
        currentCurrency = currentAndTotal.$1;
        totalUnPayedBooking = currentAndTotal.$2;
      },
    );
  }

  Future<void> convert() async {
    _update(const MainState.loading());
    final results = await mainRepo.convertCurrency(
      targetCurrency: currentCurrency,
      totalAmount: totalUnPayedBookingInUSD,
    );
    results.fold(
          (errorMessage) => _update(MainState.error(errorMessage)),
          (total) async {
        totalUnPayedBooking = total;
        await getPriceCurrency();
        _update(const MainState.success());
      },
    );
  }

  Future<void> getPriceCurrency() async {
    final results = await mainRepo.convertCurrency(
      targetCurrency: currentCurrency,
      totalAmount: 1,
    );
    results.fold(
          (errorMessage) => null,
          (total) => currentCurrencyPrice = total,
    );
  }

  void changeCurrentTab(int index) {
    _update(const MainState.loading());
    if (index == 3) {
      getSocialMedia();
    }
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

  Future<void> getSocialMedia() async {
    _update(const MainState.loading());
    final results = await mainRepo.getSocialMedia();
    results.fold(
          (message) => _update(MainState.error(message)),
          (socialMedia) {
        try {
          final Uri whatsapp = Uri.parse('https://wa.me/${socialMedia.whatsApp}');
          launchUrl(whatsapp);
          changeCurrentTab(0);
        } catch (e) {
          getIt<Logger>().e(e);
        }
        _update(const MainState.success());
      },
    );
  }

  Future<void> postNotificationToken({
    required String token,
  }) async {
    _update(const MainState.loading());
    final results = await mainRepo.postNotificationToken(
      token: token,
    );
    results.fold(
          (errorMessage) => _update(MainState.error(errorMessage)),
          (unit) => _update(const MainState.success()),
    );
  }

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
