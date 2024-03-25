import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  ProfileRepo profileRepo;

  EditProfileCubit({required this.profileRepo}) : super(const EditProfileState.initial());

  final TextEditingController fullNameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  File? image;

  void init(Client client) {
    fullNameEditingController.text = client.name;
    emailEditingController.text = client.email;
    phoneEditingController.text = client.phone;
    addressEditingController.text = client.address;
  }

  Future<void> editProfile({required Client client}) async {
    if (!updateFormKey.currentState!.validate()) return;
    final editeClient = client.copyWith(
      name: fullNameEditingController.text,
      email: emailEditingController.text,
      phone: phoneEditingController.text,
      address: addressEditingController.text,
    );
    _update(const EditProfileState.loading());
    final results = await profileRepo.editProfile(client: editeClient, image: image);
    results.fold(
      (error) => _update(EditProfileState.error(error)),
      (unit) => _update(const EditProfileState.loaded()),
    );
  }

  void _update(EditProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
