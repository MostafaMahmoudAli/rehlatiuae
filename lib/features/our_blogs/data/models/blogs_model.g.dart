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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      trip: (json['trip'] as List<dynamic>?)
          ?.map((e) => Trips.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlogsImplToJson(_$BlogsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'trip': instance.trip,
    };
