import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/message_model/message_model.dart';

abstract class MainRepo {
  Future<Either<String, Unit>> sendMessage({required Message message});
}
