import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/layout_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/message_model/message_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_request_model/review_request_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/layout_repo.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/subscribe_model/subscribe_model.dart';

class LayoutRepoImpl implements LayoutRepository {
  final ApiConsumer apiConsumer;

  LayoutRepoImpl({
    required this.apiConsumer,
  });

  @override
  Future<Either<String, LayOutModel>> fetchLayoutData() async {
    try {
      var layoutData = await apiConsumer.get(
        EndPoints.layoutEndPoint,
      );

      var layoutModel = LayOutModel.fromJson(layoutData["data"]);
      return right(layoutModel);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> sendMessage({required Message message}) async {
    try {
      await apiConsumer.post(
        EndPoints.sendMessageEndPoint,
        data: message.toJson(),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Review>> addReview({
    required ReviewRequest reviewRequest,
    required File? image,
    required bool isTrip,
  }) async {
    try {
      Map<String, dynamic> map = reviewRequest.toJson();
      if (image != null) {
        map['image_path'] = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      } else {
        map.remove('image_path');
      }
      if (!isTrip) {
        map['blog_id'] = map['trip_id'];
      }
      var response = await apiConsumer.post(
        isTrip ? EndPoints.addReview : EndPoints.addReviewBlog,
        data: map,
        isForm: true,
      );
      Review review = Review.fromJson(response['data']['review']);
      return Right(review);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> deleteReview({
    required int? id,
    required bool isTrip,
  }) async {
    try {
      await apiConsumer.delete(
        isTrip ? EndPoints.deleteReview : EndPoints.deleteReviewBlog,
        queryParameters: {
          isTrip ? 'trip_id' : 'blog_id': id,
        },
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> sendSubscribe({required SubscribeModel message}) async{
    try {
      await apiConsumer.post(
        EndPoints.subscriptionEmailEndPoint,
        data: message.toJson(),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }


}
