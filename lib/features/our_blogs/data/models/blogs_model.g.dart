// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogsImpl _$$BlogsImplFromJson(Map<String, dynamic> json) => _$BlogsImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => Trips.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlogsImplToJson(_$BlogsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'trips': instance.trips,
    };
