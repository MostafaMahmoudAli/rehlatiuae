// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_destination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllDestinations _$AllDestinationsFromJson(Map<String, dynamic> json) {
  return _AllDestinations.fromJson(json);
}

/// @nodoc
mixin _$AllDestinations {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllDestinationsCopyWith<AllDestinations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllDestinationsCopyWith<$Res> {
  factory $AllDestinationsCopyWith(
          AllDestinations value, $Res Function(AllDestinations) then) =
      _$AllDestinationsCopyWithImpl<$Res, AllDestinations>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      String? country});
}

/// @nodoc
class _$AllDestinationsCopyWithImpl<$Res, $Val extends AllDestinations>
    implements $AllDestinationsCopyWith<$Res> {
  _$AllDestinationsCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllDestinationsImplCopyWith<$Res>
    implements $AllDestinationsCopyWith<$Res> {
  factory _$$AllDestinationsImplCopyWith(_$AllDestinationsImpl value,
          $Res Function(_$AllDestinationsImpl) then) =
      __$$AllDestinationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      String? country});
}

/// @nodoc
class __$$AllDestinationsImplCopyWithImpl<$Res>
    extends _$AllDestinationsCopyWithImpl<$Res, _$AllDestinationsImpl>
    implements _$$AllDestinationsImplCopyWith<$Res> {
  __$$AllDestinationsImplCopyWithImpl(
      _$AllDestinationsImpl _value, $Res Function(_$AllDestinationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? country = freezed,
  }) {
    return _then(_$AllDestinationsImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllDestinationsImpl implements _AllDestinations {
  const _$AllDestinationsImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.country});

  factory _$AllDestinationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllDestinationsImplFromJson(json);

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

  @override
  String toString() {
    return 'AllDestinations(id: $id, name: $name, description: $description, imagePath: $imagePath, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllDestinationsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, imagePath, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllDestinationsImplCopyWith<_$AllDestinationsImpl> get copyWith =>
      __$$AllDestinationsImplCopyWithImpl<_$AllDestinationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllDestinationsImplToJson(
      this,
    );
  }
}

abstract class _AllDestinations implements AllDestinations {
  const factory _AllDestinations(
      {required final int? id,
      required final String? name,
      required final String? description,
      required final String? imagePath,
      required final String? country}) = _$AllDestinationsImpl;

  factory _AllDestinations.fromJson(Map<String, dynamic> json) =
      _$AllDestinationsImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$AllDestinationsImplCopyWith<_$AllDestinationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
