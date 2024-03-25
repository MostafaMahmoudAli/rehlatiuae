import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';

abstract class ProfileRepo {
  Future<Either<String, Client>> getProfile();

  Future<Either<String, Unit>> editProfile({required Client client, required File? image});

  Future<Either<String, Unit>> deleteAccount();
}
