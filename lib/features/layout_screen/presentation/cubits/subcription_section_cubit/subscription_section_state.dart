part of 'subscription_section_cubit.dart';

@freezed
class SubscriptionSectionState with _$SubscriptionSectionState {
  const factory SubscriptionSectionState.initial() = _Initial;
  const factory SubscriptionSectionState.loading() = _Loading;
  const factory SubscriptionSectionState.loaded() = _Loaded;
  const factory SubscriptionSectionState.error(String errorMessage) = _Error;
}
