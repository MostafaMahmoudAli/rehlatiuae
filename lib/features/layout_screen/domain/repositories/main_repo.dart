import 'package:currency_converter/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/social_media/social_media_model.dart';

abstract class MainRepo {
  Either<String, Client?> getClient();

  Future<Either<String, Unit>> addToFavourite({required int tripId});

  Either<String, (Currency, double)> getCurrentCurrencyAndTotalUnPaid();

  Future<Either<String, double?>> convertCurrency({
    required Currency targetCurrency,
    required double totalAmount,
  });

  Future<Either<String, SocialMedia>> getSocialMedia();

  Future<Either<String, Unit?>> postNotificationToken({
    required String token,
  });
}
