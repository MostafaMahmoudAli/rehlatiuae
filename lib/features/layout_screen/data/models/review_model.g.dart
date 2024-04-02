// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      starsNumber: json['starsNumber'] as int?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'starsNumber': instance.starsNumber,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'client': instance.client,
    };
