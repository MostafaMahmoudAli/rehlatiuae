import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;

  MainCubit({required this.mainRepo}) : super(const MainState.initial());

  Client? client;

  Future<void> initMain() async {
    getCachedClient();
  }

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

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
