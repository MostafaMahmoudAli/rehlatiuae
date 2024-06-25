import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/layout_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/message_model/message_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_request_model/review_request_model.dart';

import '../../data/models/subscribe_model/subscribe_model.dart';

abstract class LayoutRepository {
  Future<Either<String, LayOutModel>> fetchLayoutData({int? clientId});

  Future<Either<String, Unit>> sendMessage({required Message message});

  Future<Either<String, Unit>> sendSubscribe({required SubscribeModel message});

  Future<Either<String, Review>> addReview({
    required ReviewRequest reviewRequest,
    required File? image,
    required bool isTrip,
  });

  Future<Either<String, Unit>> deleteReview({
    required int? id,
    required bool isTrip,
  });
}
