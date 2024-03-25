import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer apiConsumer;

  ProfileRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, Client>> getProfile() async {
    try {
      var client = await apiConsumer.get(
        EndPoints.getProfileEndPoint,
      );
      final clientModel = Client.fromJson(client['data']['client']);
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
      await apiConsumer.post(
        EndPoints.editProfileEndPoint,
        data: clientMap,
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
      await apiConsumer.delete(EndPoints.deleteAccountEndPoint);
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
