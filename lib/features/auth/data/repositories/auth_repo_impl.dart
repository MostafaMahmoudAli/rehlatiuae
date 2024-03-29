import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;
  final CacheService cachingService;

  AuthRepoImpl({required this.apiConsumer, required this.cachingService});

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
          'phone': '096663651', // TODO remove after fix it from backend
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
      return Right(response['data']['token']);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, (Client, String)>> resetPassword({
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
      apiConsumer;
      final client = Client.fromJson(response['data']['client']);
      return Right((
        client,
        response['data']['token'],
      ));
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _cacheClient({required AuthenticatedClient authenticatedClient}) async {
    await cachingService.setData(
      key: AppStrings.accessToken,
      value: authenticatedClient.accessToken,
    );
    await cachingService.setData(
      key: AppStrings.expiresIn,
      value: authenticatedClient.expiresIn,
    );
    await cachingService.setData(
      key: AppStrings.client,
      value: json.encode(authenticatedClient.client.toJson()),
    );
    await cachingService.setData(
      key: AppStrings.initialLocationRoute,
      value: AppStrings.homeScreen,
    );
  }
}
