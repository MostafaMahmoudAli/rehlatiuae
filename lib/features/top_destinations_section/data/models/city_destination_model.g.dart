// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_destination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityDestinationImpl _$$CityDestinationImplFromJson(
        Map<String, dynamic> json) =>
    _$CityDestinationImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      country: json['country'] as String?,
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => Trips.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CityDestinationImplToJson(
        _$CityDestinationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'country': instance.country,
      'trips': instance.trips,
    };
