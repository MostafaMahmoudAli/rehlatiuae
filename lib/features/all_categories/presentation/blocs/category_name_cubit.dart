import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../domian/repositories/category_name_repo.dart';

part 'category_name_state.dart';

part 'category_name_cubit.freezed.dart';

class CategoryNameCubit extends Cubit<CategoryNameState> {
  final CategoryNameRepo categoryNameRepo;

  CategoryNameCubit({required this.categoryNameRepo})
      : super(const CategoryNameState.initial());

  Future<void> fetchCategoryNameTrips({required int categoryNameId}) async {
    emit(const CategoryNameState.loading());
    var results = await categoryNameRepo.fetchCategoryNameTrips(
        categoryNameId: categoryNameId);
    results.fold(
      (errorMessage) => emit(CategoryNameState.error(errorMessage)),
      (categoryNameTrips) => emit(CategoryNameState.loaded(categoryNameTrips)),
    );
  }
}
