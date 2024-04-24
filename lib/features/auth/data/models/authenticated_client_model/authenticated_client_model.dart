// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';

part 'authenticated_client_model.freezed.dart';
part 'authenticated_client_model.g.dart';

@freezed
class AuthenticatedClient with _$AuthenticatedClient {
  const factory AuthenticatedClient({
    required final Client client,
    @JsonKey(name: "access_token") required final String accessToken,
  }) = _AuthenticatedClient;

  factory AuthenticatedClient.fromJson(Map<String, dynamic> json) => _$AuthenticatedClientFromJson(json);
}
