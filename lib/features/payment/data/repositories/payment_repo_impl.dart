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
        EndPoints.sendMessageEndPoint,
        data: tripCheckoutDetails.toJson(),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
  //
  // @override
  // Future<Either<String, void>> paymentMethod({required int amount, required String currency})async {
  //   try {
  //     String clientSecret= await _getClientSecret((amount*100).toString(), currency);
  //     await _initializePaymentSheet(clientSecret);
  //     await Stripe.instance.presentPaymentSheet();
  //   } catch (error) {
  //     throw Exception(error.toString());
  //   }
  // }
  //  Future<void>_initializePaymentSheet(String clientSecret)async{
  //   await Stripe.instance.initPaymentSheet(
  //     paymentSheetParameters: SetupPaymentSheetParameters(
  //       paymentIntentClientSecret: clientSecret,
  //       merchantDisplayName: "",
  //     ),
  //   );
  // }
  //
  //  Future<String> _getClientSecret(String amount,String currency)async{
  //   var response= await apiConsumer.post(
  //     'https://api.stripe.com/v1/payment_intents',
  //     queryParameters: {
  //       'Authorization': 'Bearer ${ApiKeys.secretKey}',
  //       'Content-Type': 'application/x-www-form-urlencoded'
  //     },
  //   );
  //   return response.data["client_secret"];
  // }
}
