import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;

  RegisterCubit({required this.authRepo}) : super(const RegisterState.initial());

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

  Future<void> register() async {
    if (!registerFormKey.currentState!.validate()) return;
    _update(const RegisterState.loading());
    final results = await authRepo.register(
      name: nameEditingController.text,
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    results.fold(
      (message) => _update(RegisterState.error(message)),
      (authenticatedClient) => _update(RegisterState.success(authenticatedClient)),
    );
  }

  void _update(RegisterState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
