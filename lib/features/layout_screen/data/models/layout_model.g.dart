// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LayOutModelImpl _$$LayOutModelImplFromJson(Map<String, dynamic> json) =>
    _$LayOutModelImpl(
      topDestinations: (json['topDestinations'] as List<dynamic>?)
          ?.map((e) => AllDestinations.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestOffers: (json['bestOffers'] as List<dynamic>?)
          ?.map((e) => BestOffers.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestTrips: (json['bestTrips'] as List<dynamic>?)
          ?.map((e) => BestTrips.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularExperience: (json['popularExperiencetrips'] as List<dynamic>?)
          ?.map((e) => PopularExperiences.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogs: (json['blogs'] as List<dynamic>?)
          ?.map((e) => Blogs.fromJson(e as Map<String, dynamic>))
          .toList(),
      ourPartners: (json['ourPartners'] as List<dynamic>?)
          ?.map((e) => OurPartners.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LayOutModelImplToJson(_$LayOutModelImpl instance) =>
    <String, dynamic>{
      'topDestinations': instance.topDestinations,
      'categories': instance.categories,
      'bestOffers': instance.bestOffers,
      'bestTrips': instance.bestTrips,
      'popularExperiencetrips': instance.popularExperience,
      'blogs': instance.blogs,
      'ourPartners': instance.ourPartners,
      'reviews': instance.reviews,
    };
