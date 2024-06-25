import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  ProfileRepoImpl({required this.apiConsumer, required this.cacheService});

  @override
  Future<Either<String, Client>> getProfile() async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      var client = await apiConsumer.get(
        EndPoints.getProfileEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final clientModel = Client.fromJson(client['data']['client']);
      await cacheService.setData(
        key: AppStrings.client,
        value: json.encode(clientModel.toJson()),
      );
      return Right(clientModel);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> editProfile({required Client client, required File? image}) async {
    try {
      Map<String, dynamic> clientMap = client.toJson();
      if (image != null) {
        clientMap['image_path'] = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      } else {
        clientMap.remove('image_path');
      }
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      await apiConsumer.post(
        EndPoints.editProfileEndPoint,
        data: clientMap,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        isForm: true,
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> deleteAccount() async {
    try {
      var token = getIt<CacheService>().getData<String>(
        key: AppStrings.accessToken,
      );
      await apiConsumer.delete(
        EndPoints.deleteAccountEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      await _clearClient();
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _clearClient() async {
    await cacheService.setData(key: AppStrings.accessToken, value: null);
    await cacheService.setData(key: AppStrings.expiresIn, value: null);
    await cacheService.setData(key: AppStrings.client, value: null);
    await cacheService.setData(
      key: AppRoutesString.initialLocationRoute,
      value: AppRoutesString.homeScreen,
    );
  }
}
