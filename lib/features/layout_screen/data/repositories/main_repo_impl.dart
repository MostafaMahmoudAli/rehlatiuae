import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
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
}
