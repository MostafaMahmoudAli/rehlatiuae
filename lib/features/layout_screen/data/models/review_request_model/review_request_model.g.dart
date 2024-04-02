// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewRequestImpl _$$ReviewRequestImplFromJson(Map<String, dynamic> json) =>
    _$ReviewRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      starsNumbers: json['stars_numbers'] as int,
      imagePath: json['image_path'] as String,
      tripId: json['trip_id'] as int,
    );

Map<String, dynamic> _$$ReviewRequestImplToJson(_$ReviewRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'stars_numbers': instance.starsNumbers,
      'image_path': instance.imagePath,
      'trip_id': instance.tripId,
    };
