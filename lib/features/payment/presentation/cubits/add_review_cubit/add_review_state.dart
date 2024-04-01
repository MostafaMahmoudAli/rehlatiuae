part of 'add_review_cubit.dart';

@freezed
class AddReviewState with _$AddReviewState {
  const factory AddReviewState.initial() = _Initial;

  const factory AddReviewState.loading() = _Loading;

  const factory AddReviewState.loaded(Review review) = _Loaded;

  const factory AddReviewState.error(String message) = _Error;
}
