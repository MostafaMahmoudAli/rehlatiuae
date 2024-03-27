import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

part 'trip_checkout_details_cubit.freezed.dart';
part 'trip_checkout_details_state.dart';

class TripCheckoutDetailsCubit extends Cubit<TripCheckoutDetailsState> {
  PaymentRepo paymentRepo;

  TripCheckoutDetailsCubit({required this.paymentRepo}) : super(const TripCheckoutDetailsState.initial());

  final GlobalKey<FormState> dateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> date2FormKey = GlobalKey<FormState>();
  final TextEditingController descriptionEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();

  Coupon? coupon;
  double allSubtotal = 130, adultCost = 130, childCost = 60;
  TripCheckoutDetails tripCheckoutDetails = const TripCheckoutDetails(
    tripId: 1,
    subtotalAdult: 130,
    quantityAdult: 1,
    subtotalChild: 0,
    quantityChild: 0,
    finalSubtotal: 130,
    couponName: '',
    discount: 0,
    total: 130,
    date: '',
    description: '',
  );

  Future<void> addTripCheckoutDetails() async {
    _update(const TripCheckoutDetailsState.loading());
    double discount = coupon != null ? allSubtotal - (allSubtotal * coupon!.couponAmount) : 0;
    final results = await paymentRepo.addTripCheckoutDetails(
      tripCheckoutDetails: tripCheckoutDetails.copyWith(
        tripId: 1,
        description: descriptionEditingController.text,
        discount: discount,
        couponName: coupon != null ? coupon!.couponName : '',
        total: tripCheckoutDetails.subtotalAdult + tripCheckoutDetails.subtotalChild,
        finalSubtotal: tripCheckoutDetails.subtotalAdult + tripCheckoutDetails.subtotalChild - discount,
      ),
    );
    results.fold(
      (message) => _update(TripCheckoutDetailsState.error(message)),
      (unit) => _update(const TripCheckoutDetailsState.success()),
    );
  }

  void changeChangeDetails() {
    print(tripCheckoutDetails.subtotalAdult);
    print(tripCheckoutDetails.subtotalChild);
    allSubtotal = tripCheckoutDetails.subtotalAdult + tripCheckoutDetails.subtotalChild;
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
