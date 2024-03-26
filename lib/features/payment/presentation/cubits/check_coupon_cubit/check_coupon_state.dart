part of 'check_coupon_cubit.dart';

@freezed
class CheckCouponState with _$CheckCouponState {
  const factory CheckCouponState.initial() = _Initial;

  const factory CheckCouponState.loading() = _Loading;

  const factory CheckCouponState.success(Coupon coupon) = _Success;

  const factory CheckCouponState.error(String message) = _Error;
}
