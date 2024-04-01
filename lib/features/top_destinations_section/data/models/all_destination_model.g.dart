// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_destination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllDestinationsImpl _$$AllDestinationsImplFromJson(
        Map<String, dynamic> json) =>
    _$AllDestinationsImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$AllDestinationsImplToJson(
        _$AllDestinationsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'country': instance.country,
    };
