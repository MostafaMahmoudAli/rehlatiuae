import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/layout_model.dart';
import '../../domian/repositories/layout_repo.dart';

part 'layout_state.dart';

part 'layout_cubit.freezed.dart';

class LayoutCubit extends Cubit<LayoutState> {
  final LayoutRepository layoutRepository;

  LayoutCubit({required this.layoutRepository})
      : super(const LayoutState.initial());

  Future<void> fetchLayoutData() async
  {
    emit(const LayoutState.loading());
    final results = await layoutRepository.fetchLayoutData();
    results.fold(
      (errorMessage) => emit(LayoutState.error(errorMessage)),
      (layoutModel) => emit(LayoutState.loaded(layoutModel)),
    );
  }
}
