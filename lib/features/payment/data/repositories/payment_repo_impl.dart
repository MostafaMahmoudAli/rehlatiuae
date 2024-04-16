import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/cart_trips.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/domain/api_keys.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

import '../models/chechked_trips_offers_model/check_trips_offers_response.dart';
import '../models/chechked_trips_offers_model/checked_trips_offers_request_model.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  PaymentRepoImpl({required this.apiConsumer, required this.cacheService});

  @override
  Future<Either<String, Coupon>> checkCoupon({required String name}) async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      var response = await apiConsumer.get(
        EndPoints.checkCouponEndPoint,
        queryParameters: {'coupon_name': name},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Coupon coupon = Coupon.fromJson(response['data']['coupon']);
      return Right(coupon);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, String?>> makePayment({
    required int amount,
    required String currency,
  }) async {
    try {
      var clientSecretAndId = await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecretAndId.$1);
      await Stripe.instance.presentPaymentSheet();
      return Right(clientSecretAndId.$2);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _initializePaymentSheet(String? clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Rehlatyuae",
      ),
    );
  }

  Future<(String?, String?)> _getClientSecret(String amount, String currency) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.stripePaymentEndPoint,
        data: {
          'amount': amount,
          'currency': currency,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeApiKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      return (
        response["client_secret"] as String?,
        response["id"] as String?,
      );
    } catch (error) {
      getIt<Logger>().e(error);
      return (null, null);
    }
  }

  @override
  Future<Either<String, Unit>> succeedCheckoutTrip({
    required String sessionId,
    required int checkoutId,
  }) async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      await apiConsumer.post(
        EndPoints.succeedCheckoutTrip,
        data: {
          'session_id': sessionId,
          'checkout_id': checkoutId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, CheckTripsAndOffersResponse>> checkoutTripsAndOffers({
    required CheckedTripsAndOffersRequest checkModel,
  }) async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      var response = await apiConsumer.post(
        EndPoints.checkedTripsAndOffersEndPoint,
        data: {
          'coupon_name': checkModel.couponName,
          'description': checkModel.description,
          'selectedData': checkModel.selectedData?.map((e) => e.toJson()).toList(),
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      var checkedTripsAndOffers = CheckTripsAndOffersResponse.fromJson(response['data']["checkout"]);
      return Right(checkedTripsAndOffers);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, List<CartTrips>>> getBooking() async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      var client = await apiConsumer.get(
        EndPoints.getBookingEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      List<CartTrips> cartTrips = client['data']['cartTrips']
          .map<CartTrips>(
            (e) => CartTrips.fromJson(e),
          )
          .toList();
      List<CartTrips> cartOffers = client['data']['cartOffers']
          .map<CartTrips>(
            (e) => CartTrips.fromJson(e),
          )
          .toList();
      return Right([...cartTrips, ...cartOffers]);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
