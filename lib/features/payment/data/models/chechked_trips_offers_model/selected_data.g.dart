// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectedDataImpl _$$SelectedDataImplFromJson(Map<String, dynamic> json) =>
    _$SelectedDataImpl(
      checkIsTrip: json['checkIsTrip'] as bool?,
      id: json['id'] as int?,
      date: json['date'] as String?,
      quantityOld: json['quantity_old'] as int?,
      quantityYoung: json['quantity_young'] as int?,
    );

Map<String, dynamic> _$$SelectedDataImplToJson(_$SelectedDataImpl instance) =>
    <String, dynamic>{
      'checkIsTrip': instance.checkIsTrip,
      'id': instance.id,
      'date': instance.date,
      'quantity_old': instance.quantityOld,
      'quantity_young': instance.quantityYoung,
    };
