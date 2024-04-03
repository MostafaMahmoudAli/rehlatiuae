import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiConsumer apiConsumer;

  PaymentRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, Coupon>> checkCoupon({required String name}) async {
    try {
      var response = await apiConsumer.get(
        EndPoints.checkCouponEndPoint,
        queryParameters: {'coupon_name': name},
      );
      Coupon coupon = Coupon.fromJson(response['data']['coupon']);
      return Right(coupon);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> addTripCheckoutDetails({required TripCheckoutDetails tripCheckoutDetails}) async {
    try {
      await apiConsumer.post(
        EndPoints.addTripCheckoutDetailsEndPoint,
        data: tripCheckoutDetails.toJson(),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
