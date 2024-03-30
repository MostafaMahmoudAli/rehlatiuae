import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';

abstract class MainRepo {
  Either<String, Client?> getClient();
}
