import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  MainRepoImpl({
    required this.apiConsumer,
    required this.cacheService,
  });

  @override
  Either<String, AuthenticatedClient?> getAuthenticatedClient() {
    try {
      var stringData = cacheService.getData<String>(key: AppStrings.authenticatedClient);
      AuthenticatedClient? authenticatedClient;
      if (stringData != null) {
        authenticatedClient = AuthenticatedClient.fromJson(json.decode(stringData));
      }
      return Right(authenticatedClient);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
