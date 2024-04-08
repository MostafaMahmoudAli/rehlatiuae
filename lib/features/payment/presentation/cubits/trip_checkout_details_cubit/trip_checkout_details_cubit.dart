import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/selected_data.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

import '../../../data/models/chechked_trips_offers_model/check_trips_offers_response.dart';
import '../../../data/models/chechked_trips_offers_model/checked_trips_offers_request_model.dart';

part 'trip_checkout_details_cubit.freezed.dart';
part 'trip_checkout_details_state.dart';

class TripCheckoutDetailsCubit extends Cubit<TripCheckoutDetailsState> {
  PaymentRepo paymentRepo;

  TripCheckoutDetailsCubit({required this.paymentRepo}) : super(const TripCheckoutDetailsState.initial());

  final GlobalKey<FormState> dateOptionScreenFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dateDetailsScreenFormKey = GlobalKey<FormState>();
  final TextEditingController descriptionEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final List<TextEditingController> dateOffersEditingControllers = [];

  Coupon? coupon;
  double allSubtotal = 0;
  double totalAfterDiscount = 0;
  TripCheckoutDetails? tripCheckoutDetails;
  Trips? selectedTrip;
  bool isTripSelected = true;
  bool isDetailInit = false;
  List<Trips> selectedOffers = [];
  List<SelectedData> selectedData = [];

  void initCheckoutDetails() {
    getIt<Logger>().w(isDetailInit);
    if (isDetailInit) return;
    isDetailInit = true;
    if (isTripSelected) {
      allSubtotal = selectedTrip!.adultPrice!.toDouble();
      selectedData.add(
        SelectedData(
          checkIsTrip: true,
          id: selectedTrip!.id,
          date: dateEditingController.text,
          quantityOld: 1,
          quantityYoung: 0,
        ),
      );
      tripCheckoutDetails = TripCheckoutDetails(
        tripId: selectedTrip!.id!,
        subtotalAdult: selectedTrip!.adultPrice!.toDouble(),
        quantityAdult: 1,
        subtotalChild: selectedTrip!.childPrice!.toDouble(),
        quantityChild: 0,
        finalSubtotal: selectedTrip!.adultPrice!.toDouble(),
        couponName: '',
        discount: 0,
        total: selectedTrip!.adultPrice!.toDouble(),
        date: '',
        description: '',
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

  void addDatesAndDescription(BuildContext context) {
    if (!dateOptionScreenFormKey.currentState!.validate()) return;
    context.push(AppRoutesString.paymentDetailsScreen);

    double discount = coupon != null ? allSubtotal - (allSubtotal * coupon!.couponAmount) : 0;
    tripCheckoutDetails = tripCheckoutDetails!.copyWith(
      description: descriptionEditingController.text,
      discount: discount,
      couponName: coupon != null ? coupon!.couponName : '',
      finalSubtotal: tripCheckoutDetails!.subtotalAdult + tripCheckoutDetails!.subtotalChild,
      total: tripCheckoutDetails!.subtotalAdult + tripCheckoutDetails!.subtotalChild - discount,
    );
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

  void applyCoupon() {
    _update(const TripCheckoutDetailsState.changeChangeDetails());
    totalAfterDiscount = allSubtotal - (allSubtotal * (coupon != null ? coupon!.couponAmount / 100 : 0));
    _update(const TripCheckoutDetailsState.initial());
  }

  Future<void> addTripCheckoutDetails() async {
    _update(const TripCheckoutDetailsState.loading());
    final results = await paymentRepo.addTripCheckoutDetails(
      tripCheckoutDetails: tripCheckoutDetails!,
    );
    results.fold(
      (message) => _update(TripCheckoutDetailsState.error(message)),
      (unit) => _update(const TripCheckoutDetailsState.success()),
    );
  }

  Future<void> checkoutTripsAndOffers() async {
    _update(const TripCheckoutDetailsState.checkedTripLoading());
    var response = await paymentRepo.checkoutTripsAndOffers(
      checkModel: CheckedTripsAndOffersRequest(
        couponName: coupon?.couponName,
        selectedData: selectedData,
      ),
    );
    response.fold(
      (errorMessage) => _update(TripCheckoutDetailsState.checkedTripError(errorMessage)),
      (checkTripsAndOffersResponse) =>
          _update(TripCheckoutDetailsState.checkedTripSuccess(checkTripsAndOffersResponse)),
    );
  }

  Future<void> paymentMethod({required int amount, required String currency}) async {
    var response = await paymentRepo.paymentMethod(amount: amount, currency: currency);
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
