part of 'category_name_cubit.dart';

@freezed
class CategoryNameState with _$CategoryNameState {
  const factory CategoryNameState.initial() = _Initial;
  const factory CategoryNameState.loading() = _Loading;
  const factory CategoryNameState.loaded(List<Trips>categoryNameTrips) = _Loaded;
  const factory CategoryNameState.error(String errorMessage) = _Error;
}
