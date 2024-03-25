import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';

abstract class AuthRepo {
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
