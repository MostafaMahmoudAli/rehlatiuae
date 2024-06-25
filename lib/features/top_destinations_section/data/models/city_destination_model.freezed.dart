// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_destination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityDestination _$CityDestinationFromJson(Map<String, dynamic> json) {
  return _CityDestination.fromJson(json);
}

/// @nodoc
mixin _$CityDestination {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  List<Trips>? get trips => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityDestinationCopyWith<CityDestination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDestinationCopyWith<$Res> {
  factory $CityDestinationCopyWith(
          CityDestination value, $Res Function(CityDestination) then) =
      _$CityDestinationCopyWithImpl<$Res, CityDestination>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      String? country,
      List<Trips>? trips});
}

/// @nodoc
class _$CityDestinationCopyWithImpl<$Res, $Val extends CityDestination>
    implements $CityDestinationCopyWith<$Res> {
  _$CityDestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? country = freezed,
    Object? trips = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      trips: freezed == trips
          ? _value.trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityDestinationImplCopyWith<$Res>
    implements $CityDestinationCopyWith<$Res> {
  factory _$$CityDestinationImplCopyWith(_$CityDestinationImpl value,
          $Res Function(_$CityDestinationImpl) then) =
      __$$CityDestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      String? country,
      List<Trips>? trips});
}

/// @nodoc
class __$$CityDestinationImplCopyWithImpl<$Res>
    extends _$CityDestinationCopyWithImpl<$Res, _$CityDestinationImpl>
    implements _$$CityDestinationImplCopyWith<$Res> {
  __$$CityDestinationImplCopyWithImpl(
      _$CityDestinationImpl _value, $Res Function(_$CityDestinationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? country = freezed,
    Object? trips = freezed,
  }) {
    return _then(_$CityDestinationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      trips: freezed == trips
          ? _value._trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityDestinationImpl implements _CityDestination {
  const _$CityDestinationImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.country,
      required final List<Trips>? trips})
      : _trips = trips;

  factory _$CityDestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityDestinationImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imagePath;
  @override
  final String? country;
  final List<Trips>? _trips;
  @override
  List<Trips>? get trips {
    final value = _trips;
    if (value == null) return null;
    if (_trips is EqualUnmodifiableListView) return _trips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CityDestination(id: $id, name: $name, description: $description, imagePath: $imagePath, country: $country, trips: $trips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityDestinationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other._trips, _trips));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imagePath,
      country, const DeepCollectionEquality().hash(_trips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityDestinationImplCopyWith<_$CityDestinationImpl> get copyWith =>
      __$$CityDestinationImplCopyWithImpl<_$CityDestinationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityDestinationImplToJson(
      this,
    );
  }
}

abstract class _CityDestination implements CityDestination {
  const factory _CityDestination(
      {required final int? id,
      required final String? name,
      required final String? description,
      required final String? imagePath,
      required final String? country,
      required final List<Trips>? trips}) = _$CityDestinationImpl;

  factory _CityDestination.fromJson(Map<String, dynamic> json) =
      _$CityDestinationImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imagePath;
  @override
  String? get country;
  @override
  List<Trips>? get trips;
  @override
  @JsonKey(ignore: true)
  _$$CityDestinationImplCopyWith<_$CityDestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
