import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

part 'check_coupon_cubit.freezed.dart';
part 'check_coupon_state.dart';

class CheckCouponCubit extends Cubit<CheckCouponState> {
  PaymentRepo paymentRepo;

  CheckCouponCubit({required this.paymentRepo}) : super(const CheckCouponState.initial());

  final TextEditingController couponEditingController = TextEditingController();

  Future<void> checkCoupon() async {
    _update(const CheckCouponState.loading());
    final results = await paymentRepo.checkCoupon(
      name: couponEditingController.text,
    );
    results.fold(
      (message) => _update(CheckCouponState.error(message)),
      (coupon) => _update(CheckCouponState.success(coupon)),
    );
  }

  void _update(CheckCouponState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
