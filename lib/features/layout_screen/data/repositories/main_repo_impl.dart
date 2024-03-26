import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/message_model/message_model.dart';
import 'package:rehlatyuae/features/layout_screen/domain/repositories/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final ApiConsumer apiConsumer;

  MainRepoImpl({required this.apiConsumer});

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
}
