import 'dart:convert';

import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/social_media/social_media_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  MainRepoImpl({
    required this.apiConsumer,
    required this.cacheService,
  });

  @override
  Either<String, Client?> getClient() {
    try {
      var stringData = cacheService.getData<String>(key: AppStrings.client);
      Client? client;
      if (stringData != null) {
        client = Client.fromJson(json.decode(stringData));
      }
      return Right(client);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, Unit>> addToFavourite({required int tripId}) async {
    try {
      await apiConsumer.post(
        EndPoints.favoriteTrip,
        data: {
          'trip_id': tripId,
        },
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Either<String, (Currency, double)> getCurrentCurrencyAndTotalUnPaid() {
    try {
      var stringCurrency = cacheService.getData<String>(
        key: AppStrings.currentCurrency,
      );
      Currency currency = Currency.usd;
      if (stringCurrency != null) {
        currency = fromName(stringCurrency);
      }
      double totalUnPayedBooking = cacheService.getData<double>(
            key: AppStrings.totalUnPaidBooking,
          ) ??
          0;
      return Right(
        (currency, totalUnPayedBooking),
      );
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, double?>>convertCurrency({
    required Currency targetCurrency,
    required double totalAmount,
  }) async {
    try {
      final total = await CurrencyConverter.convert(
        from: Currency.usd,
        to: targetCurrency,
        amount: totalAmount,
      );
      cacheService.setData(
        key: AppStrings.currentCurrency,
        value: targetCurrency.name,
      );
      cacheService.setData(
        key: AppStrings.totalUnPaidBooking,
        value: total,
      );
      return Right(total);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }

  Currency fromName(String name) {
    switch (name) {
      case 'aed':
        return Currency.aed;
      case 'usd':
        return Currency.usd;
      case 'sar':
        return Currency.sar;
      case 'eur':
        return Currency.eur;
      default:
        return Currency.usd;
    }
  }

  @override
  Future<Either<String, SocialMedia>> getSocialMedia() async {
    try {
      var response = await apiConsumer.get(
        EndPoints.socialMedia,
      );
      var socialMedia = SocialMedia.fromJson(response['data']['SocialMedia']);
      return Right(socialMedia);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit?>> postNotificationToken({required String token,})async {
    try {
      await apiConsumer.post(
        EndPoints.notificationTokenEndPoint,
        data: {
          'token': token,
          'deviceToken': "mobile App",
        },
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
