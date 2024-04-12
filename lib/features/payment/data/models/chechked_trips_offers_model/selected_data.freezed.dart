// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectedData _$SelectedDataFromJson(Map<String, dynamic> json) {
  return _SelectedData.fromJson(json);
}

/// @nodoc
mixin _$SelectedData {
  bool? get checkIsTrip => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity_old")
  int? get quantityOld => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity_young")
  int? get quantityYoung => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedDataCopyWith<SelectedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedDataCopyWith<$Res> {
  factory $SelectedDataCopyWith(
          SelectedData value, $Res Function(SelectedData) then) =
      _$SelectedDataCopyWithImpl<$Res, SelectedData>;
  @useResult
  $Res call(
      {bool? checkIsTrip,
      int? id,
      String? date,
      @JsonKey(name: "quantity_old") int? quantityOld,
      @JsonKey(name: "quantity_young") int? quantityYoung});
}

/// @nodoc
class _$SelectedDataCopyWithImpl<$Res, $Val extends SelectedData>
    implements $SelectedDataCopyWith<$Res> {
  _$SelectedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkIsTrip = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? quantityOld = freezed,
    Object? quantityYoung = freezed,
  }) {
    return _then(_value.copyWith(
      checkIsTrip: freezed == checkIsTrip
          ? _value.checkIsTrip
          : checkIsTrip // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOld: freezed == quantityOld
          ? _value.quantityOld
          : quantityOld // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityYoung: freezed == quantityYoung
          ? _value.quantityYoung
          : quantityYoung // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedDataImplCopyWith<$Res>
    implements $SelectedDataCopyWith<$Res> {
  factory _$$SelectedDataImplCopyWith(
          _$SelectedDataImpl value, $Res Function(_$SelectedDataImpl) then) =
      __$$SelectedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? checkIsTrip,
      int? id,
      String? date,
      @JsonKey(name: "quantity_old") int? quantityOld,
      @JsonKey(name: "quantity_young") int? quantityYoung});
}

/// @nodoc
class __$$SelectedDataImplCopyWithImpl<$Res>
    extends _$SelectedDataCopyWithImpl<$Res, _$SelectedDataImpl>
    implements _$$SelectedDataImplCopyWith<$Res> {
  __$$SelectedDataImplCopyWithImpl(
      _$SelectedDataImpl _value, $Res Function(_$SelectedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkIsTrip = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? quantityOld = freezed,
    Object? quantityYoung = freezed,
  }) {
    return _then(_$SelectedDataImpl(
      checkIsTrip: freezed == checkIsTrip
          ? _value.checkIsTrip
          : checkIsTrip // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOld: freezed == quantityOld
          ? _value.quantityOld
          : quantityOld // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityYoung: freezed == quantityYoung
          ? _value.quantityYoung
          : quantityYoung // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedDataImpl implements _SelectedData {
  const _$SelectedDataImpl(
      {required this.checkIsTrip,
      required this.id,
      required this.date,
      @JsonKey(name: "quantity_old") required this.quantityOld,
      @JsonKey(name: "quantity_young") required this.quantityYoung});

  factory _$SelectedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedDataImplFromJson(json);

  @override
  final bool? checkIsTrip;
  @override
  final int? id;
  @override
  final String? date;
  @override
  @JsonKey(name: "quantity_old")
  final int? quantityOld;
  @override
  @JsonKey(name: "quantity_young")
  final int? quantityYoung;

  @override
  String toString() {
    return 'SelectedData(checkIsTrip: $checkIsTrip, id: $id, date: $date, quantityOld: $quantityOld, quantityYoung: $quantityYoung)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedDataImpl &&
            (identical(other.checkIsTrip, checkIsTrip) ||
                other.checkIsTrip == checkIsTrip) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.quantityOld, quantityOld) ||
                other.quantityOld == quantityOld) &&
            (identical(other.quantityYoung, quantityYoung) ||
                other.quantityYoung == quantityYoung));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, checkIsTrip, id, date, quantityOld, quantityYoung);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedDataImplCopyWith<_$SelectedDataImpl> get copyWith =>
      __$$SelectedDataImplCopyWithImpl<_$SelectedDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedDataImplToJson(
      this,
    );
  }
}

abstract class _SelectedData implements SelectedData {
  const factory _SelectedData(
          {required final bool? checkIsTrip,
          required final int? id,
          required final String? date,
          @JsonKey(name: "quantity_old") required final int? quantityOld,
          @JsonKey(name: "quantity_young") required final int? quantityYoung}) =
      _$SelectedDataImpl;

  factory _SelectedData.fromJson(Map<String, dynamic> json) =
      _$SelectedDataImpl.fromJson;

  @override
  bool? get checkIsTrip;
  @override
  int? get id;
  @override
  String? get date;
  @override
  @JsonKey(name: "quantity_old")
  int? get quantityOld;
  @override
  @JsonKey(name: "quantity_young")
  int? get quantityYoung;
  @override
  @JsonKey(ignore: true)
  _$$SelectedDataImplCopyWith<_$SelectedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
