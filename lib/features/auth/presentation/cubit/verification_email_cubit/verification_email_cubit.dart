import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

part 'verification_email_cubit.freezed.dart';
part 'verification_email_state.dart';

class VerificationEmailCubit extends Cubit<VerificationEmailState> {
  AuthRepo authRepo;

  VerificationEmailCubit({required this.authRepo}) : super(const VerificationEmailState.initial());

  String code = '';

  Future<void> verificationEmail({required String email}) async {
    _update(const VerificationEmailState.loading());
    final results = await authRepo.verificationEmail(
      code: code,
      email: email,
    );
    results.fold(
      (message) => _update(VerificationEmailState.error(message)),
      (code) => _update(VerificationEmailState.success(code)),
    );
  }

  void _update(VerificationEmailState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
