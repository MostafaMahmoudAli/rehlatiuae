import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/layout_model.dart';
import '../../domain/repositories/layout_repo.dart';

part 'layout_cubit.freezed.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  final LayoutRepository layoutRepository;

  LayoutCubit({required this.layoutRepository}) : super(const LayoutState.initial());

  Future<void> fetchLayoutData() async {
    emit(const LayoutState.loading());
    final results = await layoutRepository.fetchLayoutData();

    results.fold(
      (errorMessage) => _update(LayoutState.error(errorMessage)),
      (layoutModel) {
        _update(LayoutState.loaded(layoutModel));
      },
    );
  }

  void _update(LayoutState state) {
    if (!isClosed) {
      emit(state);
    }
}
}
