import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepoImpl({required this.apiConsumer});

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
}
