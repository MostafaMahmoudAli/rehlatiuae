part of 'verification_email_cubit.dart';

@freezed
class VerificationEmailState with _$VerificationEmailState {
  const factory VerificationEmailState.initial() = _Initial;

  const factory VerificationEmailState.loading() = _Loading;

  const factory VerificationEmailState.success(String token) = _Success;

  const factory VerificationEmailState.error(String message) = _Error;
}
