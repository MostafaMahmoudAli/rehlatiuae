import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

part 'forget_password_cubit.freezed.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  AuthRepo authRepo;

  ForgetPasswordCubit({required this.authRepo}) : super(const ForgetPasswordState.initial());

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();

  Future<void> forgetPassword() async {
    if (!forgetPasswordFormKey.currentState!.validate()) return;
    _update(const ForgetPasswordState.loading());
    final results = await authRepo.forgetPassword(email: emailEditingController.text);
    results.fold(
      (message) => _update(ForgetPasswordState.error(message)),
      (unit) => _update(const ForgetPasswordState.success()),
    );
  }

  void _update(ForgetPasswordState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
