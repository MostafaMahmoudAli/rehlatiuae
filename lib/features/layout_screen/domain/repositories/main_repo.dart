import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/auth/data/models/authenticated_client_model/authenticated_client_model.dart';

abstract class MainRepo {
  Either<String, AuthenticatedClient?> getAuthenticatedClient();
}
