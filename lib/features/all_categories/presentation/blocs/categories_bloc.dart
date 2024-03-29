import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/categories_model.dart';
import '../../domian/repositories/category_repo.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepo categoryRepo;

  CategoriesBloc({required this.categoryRepo})
      : super(const CategoriesState()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        if (state.hasReachedMax == true) {
          return;
        }
        if (state.status == CategoriesStatus.loading) {
          var results = await categoryRepo.fetchCategories();
          results.fold(
            (errorMessage) => emit(
              state.copyWith(
                status: CategoriesStatus.error,
                errMessage: errorMessage,
              ),
            ),
            (categories) => emit(
              state.copyWith(
                status: CategoriesStatus.success,
                categories: categories,
                hasReachedMax: false,
              ),
            ),
          );
        } else {
          var results = await categoryRepo.fetchCategories(
              startIndex: state.categories.length);
          results.fold(
            (errorMessage) => emit(
              state.copyWith(
                status: CategoriesStatus.error,
                errMessage: errorMessage,
              ),
            ),
            (categories) {
              categories.isEmpty ? emit(state.copyWith(hasReachedMax: true))
                  :
              emit(state.copyWith(
              status: CategoriesStatus.success,
              categories: List.of(state.categories)..addAll(categories),
              hasReachedMax: false,
            ),
              );
            },
          );
        }
      }
    },
      transformer:droppable(),
    );
  }
}
