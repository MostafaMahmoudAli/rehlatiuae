import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';

abstract class AuthRepo {
  Future<Either<String, AuthenticatedClient>> login({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> forgetPassword({required String email});

  Future<Either<String, String>> verificationEmail({
    required String email,
    required String code,
  });

  Future<Either<String, (Client, String)>> resetPassword({
    required String password,
    required String passwordConfirmation,
    required String token,
  });
}
