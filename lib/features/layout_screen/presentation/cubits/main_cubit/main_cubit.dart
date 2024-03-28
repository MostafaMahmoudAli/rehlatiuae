import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;

  MainCubit({required this.mainRepo}) : super(const MainState.initial());

  AuthenticatedClient? authenticatedClient;

  Future<void> initMain() async {
    _update(const MainState.loading());
    // Get AuthenticatedClient if already exists
    final results = mainRepo.getAuthenticatedClient();
    results.fold(
      (errorMessage) => _update(MainState.error(errorMessage)),
      (authenticatedClient) {
        this.authenticatedClient = authenticatedClient;
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
