import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

part 'trip_checkout_details_cubit.freezed.dart';
part 'trip_checkout_details_state.dart';

class TripCheckoutDetailsCubit extends Cubit<TripCheckoutDetailsState> {
  PaymentRepo paymentRepo;

  TripCheckoutDetailsCubit({required this.paymentRepo}) : super(const TripCheckoutDetailsState.initial());

  final TextEditingController couponEditingController = TextEditingController();
  final TextEditingController descriptionEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  int adultsCount = 1, childrenCount = 0;
  double allSubtotal = 0, subtotalAdult = 0, subtotalChild = 0;

  Future<void> addTripCheckoutDetails() async {
    if (dateEditingController.text == '') return;
    _update(const TripCheckoutDetailsState.loading());
    final results = await paymentRepo.addTripCheckoutDetails(
      tripCheckoutDetails: TripCheckoutDetails(
        tripId: 1,
        subtotalAdult: subtotalAdult,
        quantityAdult: adultsCount,
        subtotalChild: subtotalChild,
        quantityChild: childrenCount,
        finalSubtotal: (adultsCount * 1 + childrenCount * 1),
        couponName: couponEditingController.text,
        discount: 0,
        total: (adultsCount * 1 + childrenCount * 1) * 0.4,
        date: dateEditingController.text,
        description: descriptionEditingController.text,
      ),
    );
    results.fold(
      (message) => _update(TripCheckoutDetailsState.error(message)),
      (unit) => _update(const TripCheckoutDetailsState.success()),
    );
  }

  void changeChangeDetails() {
    allSubtotal = subtotalAdult + subtotalChild;
    _update(
      const TripCheckoutDetailsState.changeChangeDetails(),
    );
    _update(
      const TripCheckoutDetailsState.initial(),
    );
  }

  void _update(TripCheckoutDetailsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
