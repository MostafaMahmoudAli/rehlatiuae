part of 'layout_cubit.dart';

@freezed
class LayoutState with _$LayoutState {
  const factory LayoutState.initial() = _Initial;
  const factory LayoutState.loading() = _loading;
  const factory LayoutState.loaded(LayOutModel layoutModel) = _Loaded;
  const factory LayoutState.error(String errorMessage) = _Error;
}
