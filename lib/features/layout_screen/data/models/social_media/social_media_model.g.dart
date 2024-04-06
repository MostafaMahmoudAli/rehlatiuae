// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialMediaImpl _$$SocialMediaImplFromJson(Map<String, dynamic> json) =>
    _$SocialMediaImpl(
      id: json['id'] as int,
      whatsApp: json['whatsApp'] as String,
      facebook: json['facebook'] as String,
      youtube: json['youtube'] as String,
      twitter: json['twitter'] as String,
      instagram: json['instagram'] as String,
      linkedIn: json['linkedIn'] as String,
    );

Map<String, dynamic> _$$SocialMediaImplToJson(_$SocialMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whatsApp': instance.whatsApp,
      'facebook': instance.facebook,
      'youtube': instance.youtube,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'linkedIn': instance.linkedIn,
    };
