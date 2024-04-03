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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      reviewAverage: (json['reviewAverage'] as num?)?.toDouble(),
      blogReview: (json['blogReview'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      trip: json['trip'] == null
          ? null
          : Trips.fromJson(json['trip'] as Map<String, dynamic>),
      reviewsCount: json['review_count'] == null
          ? null
          : ReviewCount.fromJson(json['review_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BlogsImplToJson(_$BlogsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'created_at': instance.createdAt?.toIso8601String(),
      'reviewAverage': instance.reviewAverage,
      'blogReview': instance.blogReview,
      'trip': instance.trip,
      'review_count': instance.reviewsCount,
    };
