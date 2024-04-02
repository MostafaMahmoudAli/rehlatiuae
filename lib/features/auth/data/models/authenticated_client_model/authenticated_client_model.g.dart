// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticatedClientImpl _$$AuthenticatedClientImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticatedClientImpl(
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      expiresIn: json['expires_in'] as int,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$$AuthenticatedClientImplToJson(
        _$AuthenticatedClientImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
    };
