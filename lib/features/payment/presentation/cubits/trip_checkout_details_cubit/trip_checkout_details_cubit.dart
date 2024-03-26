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
  String? date;
  int adultsCount = 1, childrenCount = 0;

  Future<void> addTripCheckoutDetails() async {
    if (date == null) return;
    _update(const TripCheckoutDetailsState.loading());
    final results = await paymentRepo.addTripCheckoutDetails(
      tripCheckoutDetails: TripCheckoutDetails(
        tripId: 1,
        subtotalAdult: adultsCount * 1,
        quantityAdult: adultsCount,
        subtotalChild: childrenCount * 1,
        quantityChild: childrenCount,
        finalSubtotal: (adultsCount * 1 + childrenCount * 1),
        couponName: couponEditingController.text,
        discount: 0,
        total: (adultsCount * 1 + childrenCount * 1) * 0.4,
        date: date!,
        description: descriptionEditingController.text,
      ),
    );
    results.fold(
      (message) => _update(TripCheckoutDetailsState.error(message)),
      (unit) => _update(const TripCheckoutDetailsState.success()),
    );
  }

  void _update(TripCheckoutDetailsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
