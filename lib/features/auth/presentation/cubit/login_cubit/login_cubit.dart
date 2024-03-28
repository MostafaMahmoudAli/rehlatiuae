import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit({required this.authRepo}) : super(const LoginState.initial());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;
    _update(const LoginState.loading());
    final results = await authRepo.login(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    results.fold(
      (message) => _update(LoginState.error(message)),
      (authenticatedClient) => _update(LoginState.success(authenticatedClient)),
    );
  }

  void _update(LoginState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
