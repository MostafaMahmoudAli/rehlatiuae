import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';

part 'update_password_cubit.freezed.dart';
part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  AuthRepo authRepo;

  UpdatePasswordCubit({required this.authRepo}) : super(const UpdatePasswordState.initial());

  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController passwordConfirmationEditingController = TextEditingController();

  Future<void> updatePassword({required String token}) async {
    if (!updatePasswordFormKey.currentState!.validate()) return;
    _update(const UpdatePasswordState.loading());
    final results = await authRepo.resetPassword(
      password: passwordEditingController.text,
      passwordConfirmation: passwordConfirmationEditingController.text,
      token: token,
    );
    results.fold(
      (message) => _update(UpdatePasswordState.error(message)),
      (pair) => _update(UpdatePasswordState.success(pair.$1, pair.$2)),
    );
  }

  void _update(UpdatePasswordState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
