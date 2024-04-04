// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewCountImpl _$$ReviewCountImplFromJson(Map<String, dynamic> json) =>
    _$ReviewCountImpl(
      oneStar: json['one_star'] as int?,
      towStar: json['tow_star'] as int?,
      threeStar: json['three_star'] as int?,
      fourStar: json['four_star'] as int?,
      fiveStar: json['five_star'] as int?,
    );

Map<String, dynamic> _$$ReviewCountImplToJson(_$ReviewCountImpl instance) =>
    <String, dynamic>{
      'one_star': instance.oneStar,
      'tow_star': instance.towStar,
      'three_star': instance.threeStar,
      'four_star': instance.fourStar,
      'five_star': instance.fiveStar,
    };
