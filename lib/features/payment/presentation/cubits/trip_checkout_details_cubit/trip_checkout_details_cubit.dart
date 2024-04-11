import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/selected_data.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

import '../../../data/models/chechked_trips_offers_model/check_trips_offers_response.dart';
import '../../../data/models/chechked_trips_offers_model/checked_trips_offers_request_model.dart';

part 'trip_checkout_details_cubit.freezed.dart';
part 'trip_checkout_details_state.dart';

class TripCheckoutDetailsCubit extends Cubit<TripCheckoutDetailsState> {
  final PaymentRepo paymentRepo;

  TripCheckoutDetailsCubit({required this.paymentRepo}) : super(const TripCheckoutDetailsState.initial());

  final GlobalKey<FormState> dateOptionScreenFormKey = GlobalKey<FormState>();
  final TextEditingController descriptionEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final List<TextEditingController> dateOffersEditingControllers = [];

  Coupon? coupon;
  double allSubtotal = 0;
  double totalAfterDiscount = 0;
  Trips? selectedTrip;
  bool isTripSelected = true;
  bool isOffer = false;
  bool isDetailInit = false;
  List<Trips> selectedOffers = [];
  List<SelectedData> selectedData = [];

  void initCheckoutDetails() {
    if (isDetailInit) return;
    isDetailInit = true;
    if (isTripSelected) {
      allSubtotal = selectedTrip!.adultPrice!.toDouble();
      selectedData.add(
        SelectedData(
          checkIsTrip: !isOffer,
          id: selectedTrip!.id,
          date: dateEditingController.text,
          quantityOld: 1,
          quantityYoung: 0,
        ),
      );
    }
    for (var element in selectedOffers) {
      var dateOffersEditingController = TextEditingController();
      dateOffersEditingControllers.add(dateOffersEditingController);
      allSubtotal = allSubtotal + element.adultPrice!;

      selectedData.add(
        SelectedData(
          checkIsTrip: false,
          id: element.id,
          date: dateOffersEditingController.text,
          quantityOld: 1,
          quantityYoung: 0,
        ),
      );
    }
    totalAfterDiscount = allSubtotal;
  }

  void onAdultsCountChange({
    required int index,
    required int count,
    required double total,
  }) {
    selectedData[index] = selectedData[index].copyWith(quantityOld: count);
    allSubtotal = (allSubtotal + total);
    applyCoupon();
  }

  void onChildrenCountChange({
    required int index,
    required int count,
    required double total,
  }) {
    selectedData[index] = selectedData[index].copyWith(quantityYoung: count);
    allSubtotal += total;
    applyCoupon();
  }

  void applyCoupon() {
    _update(const TripCheckoutDetailsState.changeChangeDetails());
    totalAfterDiscount = allSubtotal - (allSubtotal * (coupon != null ? coupon!.couponAmount / 100 : 0));
    _update(const TripCheckoutDetailsState.initial());
  }

  void addDatesAndDescription(BuildContext context) {
    if (!dateOptionScreenFormKey.currentState!.validate()) return;
    context.push(AppRoutesString.paymentDetailsScreen);

    if (isTripSelected) {
      selectedData[0] = selectedData[0].copyWith(
        date: dateEditingController.text,
      );
    }
    for (int i = 0; i < selectedOffers.length; i++) {
      selectedData[i + (isTripSelected ? 1 : 0)] = selectedData[i + (isTripSelected ? 1 : 0)].copyWith(
        date: dateOffersEditingControllers[i].text,
      );
    }
  }

  void onClosePaymentOptionsScreen() {
    coupon = null;
    allSubtotal = 0;
    totalAfterDiscount = 0;
    isDetailInit = false;
    selectedData = [];
  }

  void onCloseTripDetailsScreen() {
    selectedOffers.clear();
    isTripSelected = true;
  }

  Future<void> checkoutTripsAndOffers() async {
    _update(const TripCheckoutDetailsState.checkedTripLoading());
    var response = await paymentRepo.checkoutTripsAndOffers(
      checkModel: CheckedTripsAndOffersRequest(
        couponName: coupon?.couponName,
        description: descriptionEditingController.text,
        selectedData: selectedData,
      ),
    );
    response.fold(
      (errorMessage) => _update(
        TripCheckoutDetailsState.checkedTripError(errorMessage),
      ),
      (checkTripsAndOffersResponse) => _update(
        TripCheckoutDetailsState.checkedTripSuccess(checkTripsAndOffersResponse),
      ),
    );
  }

  Future<void> makePayment({required String currency}) async {
    _update(const TripCheckoutDetailsState.stripeLoading());
    var response = await paymentRepo.makePayment(
      amount: totalAfterDiscount.ceil(),
      currency: currency,
    );
    response.fold(
      (errorMessage) => _update(TripCheckoutDetailsState.stripeError(errorMessage)),
      (unit) => _update(const TripCheckoutDetailsState.stripeSuccess()),
    );
  }

  void _update(TripCheckoutDetailsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
