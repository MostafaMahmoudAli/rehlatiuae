import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/subscribe_model/subscribe_model.dart';
import '../../../domain/repositories/layout_repo.dart';

part 'subscription_section_state.dart';
part 'subscription_section_cubit.freezed.dart';

class SubscriptionSectionCubit extends Cubit<SubscriptionSectionState>
{
  final LayoutRepository layoutRepository;
  SubscriptionSectionCubit({required this.layoutRepository}) : super(const SubscriptionSectionState.initial());
  final TextEditingController subscribeNameEditingController = TextEditingController();
  final TextEditingController subscribeMailEditingController = TextEditingController();
  final GlobalKey<FormState> subscribeFormKey = GlobalKey<FormState>();
  Future<void>sendSubscribe()async
  {
    if (!subscribeFormKey.currentState!.validate()) return;
    _update(const SubscriptionSectionState.loading());
    final results = await layoutRepository.sendSubscribe(
      message: SubscribeModel(
        name: subscribeNameEditingController.text,
        email: subscribeMailEditingController.text,
      ),
    );
    results.fold(
          (message) => _update(SubscriptionSectionState.error(message)),
          (unit) => _update(const SubscriptionSectionState.loaded()),
    );
  }

  void _update(SubscriptionSectionState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
