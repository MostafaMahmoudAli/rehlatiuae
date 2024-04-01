import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_request_model/review_request_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/layout_repo.dart';

part 'add_review_cubit.freezed.dart';
part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final LayoutRepository layoutRepository;

  AddReviewCubit({required this.layoutRepository}) : super(const AddReviewState.initial());

  final TextEditingController descriptionEditingController = TextEditingController();
  int ratingNumber = 1;
  XFile? pickedImage;

  Future<void> addReview({required int id, required String name}) async {
    _update(const AddReviewState.loading());
    final results = await layoutRepository.addReview(
      reviewRequest: ReviewRequest(
        tripId: id,
        name: name,
        description: descriptionEditingController.text,
        starsNumbers: ratingNumber,
        imagePath: '',
      ),
      image: pickedImage != null ? File(pickedImage!.path) : null,
    );
    results.fold(
      (error) => _update(AddReviewState.error(error)),
      (review) {
        descriptionEditingController.clear();
        _update(AddReviewState.loaded(review));
      },
    );
  }

  void _update(AddReviewState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
