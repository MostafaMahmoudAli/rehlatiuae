import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/message_model/message_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/layout_repo.dart';

part 'send_message_cubit.freezed.dart';
part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  LayoutRepository layoutRepo;

  SendMessageCubit({required this.layoutRepo}) : super(const SendMessageState.initial());

  final GlobalKey<FormState> sendMessageFormKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController descriptionEditingController = TextEditingController();

  Future<void> sendMessage() async {
    if (!sendMessageFormKey.currentState!.validate()) return;
    _update(const SendMessageState.loading());
    final results = await layoutRepo.sendMessage(
      message: Message(
        name: nameEditingController.text,
        email: emailEditingController.text,
        description: descriptionEditingController.text,
      ),
    );
    results.fold(
      (message) => _update(SendMessageState.error(message)),
      (unit) => _update(const SendMessageState.success()),
    );
  }

  void _update(SendMessageState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
