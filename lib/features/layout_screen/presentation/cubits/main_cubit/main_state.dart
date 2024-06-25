part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;

  const factory MainState.loading() = _Loading;

  const factory MainState.success() = _Success;

  const factory MainState.error(String message) = _Error;
}
