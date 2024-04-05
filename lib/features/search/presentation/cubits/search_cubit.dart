import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/search_model.dart';
import '../../domain/repositories/search_repo.dart';

part 'search_state.dart';

part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit({required this.searchRepo}) : super(const SearchState.initial());

  Future<void> fetchSearchData({String? name}) async {
    emit(const SearchState.loading());

    var results = await searchRepo.fetchSearchData(name: name);
    results.fold(
      (errorMessage) => _update(SearchState.error(errorMessage)),
      (searchList) {

        _update(SearchState.loaded(searchList));
        },
    );
  }

  void _update(SearchState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
