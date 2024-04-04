import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  AuthRepoImpl({required this.apiConsumer, required this.cacheService});

  @override
  Future<Either<String, AuthenticatedClient>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.loginEndPoint,
        data: {
          'email': email,
          'password': password,
        },
      );
      var authenticatedClient = AuthenticatedClient.fromJson(response['data']);
      await _cacheClient(authenticatedClient: authenticatedClient);
      return Right(authenticatedClient);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, AuthenticatedClient>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.registerEndPoint,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      var authenticatedClient = AuthenticatedClient.fromJson(response['data']);
      await _cacheClient(authenticatedClient: authenticatedClient);
      return Right(authenticatedClient);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> logout() async {
    try {
      await apiConsumer.post(
        EndPoints.logoutEndPoint,
        data: {},
      );
      _clearClient();
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> forgetPassword({required String email}) async {
    try {
      await apiConsumer.post(
        EndPoints.forgetPasswordEndPoint,
        data: {'email': email},
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, String>> verificationEmail({
    required String email,
    required String code,
  }) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.verificationEmailEndPoint,
        data: {
          'email': email,
          'code': code,
        },
      );
      String updatePasswordToken = response['data']['token'];
      await cacheService.setData(
        key: AppStrings.updatePasswordToken,
        value: updatePasswordToken,
      );
      return Right(updatePasswordToken);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, AuthenticatedClient>> updatePassword({
    required String password,
    required String passwordConfirmation,
    required String token,
  }) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.resetPasswordEndPoint,
        data: {
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      var authenticatedClient = AuthenticatedClient.fromJson(response['data']);
      await _cacheClient(authenticatedClient: authenticatedClient);
      await cacheService.setData(
        key: AppStrings.updatePasswordToken,
        value: null,
      );
      return Right(authenticatedClient);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _cacheClient({required AuthenticatedClient authenticatedClient}) async {
    await cacheService.setData(
      key: AppStrings.accessToken,
      value: authenticatedClient.accessToken,
    );
    await cacheService.setData(
      key: AppStrings.expiresIn,
      value: authenticatedClient.expiresIn,
    );
    await cacheService.setData(
      key: AppStrings.client,
      value: json.encode(authenticatedClient.client.toJson()),
    );
    await cacheService.setData(
      key: AppRoutesString.initialLocationRoute,
      value: AppRoutesString.homeScreen,
    );
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
