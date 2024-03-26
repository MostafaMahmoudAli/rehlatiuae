// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'our_partners_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OurPartners _$OurPartnersFromJson(Map<String, dynamic> json) {
  return _OurPartners.fromJson(json);
}

/// @nodoc
mixin _$OurPartners {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OurPartnersCopyWith<OurPartners> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OurPartnersCopyWith<$Res> {
  factory $OurPartnersCopyWith(
          OurPartners value, $Res Function(OurPartners) then) =
      _$OurPartnersCopyWithImpl<$Res, OurPartners>;
  @useResult
  $Res call({int? id, String? name, String? description, String? imagePath});
}

/// @nodoc
class _$OurPartnersCopyWithImpl<$Res, $Val extends OurPartners>
    implements $OurPartnersCopyWith<$Res> {
  _$OurPartnersCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OurPartnersImplCopyWith<$Res>
    implements $OurPartnersCopyWith<$Res> {
  factory _$$OurPartnersImplCopyWith(
          _$OurPartnersImpl value, $Res Function(_$OurPartnersImpl) then) =
      __$$OurPartnersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? description, String? imagePath});
}

/// @nodoc
class __$$OurPartnersImplCopyWithImpl<$Res>
    extends _$OurPartnersCopyWithImpl<$Res, _$OurPartnersImpl>
    implements _$$OurPartnersImplCopyWith<$Res> {
  __$$OurPartnersImplCopyWithImpl(
      _$OurPartnersImpl _value, $Res Function(_$OurPartnersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_$OurPartnersImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OurPartnersImpl implements _OurPartners {
  const _$OurPartnersImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath});

  factory _$OurPartnersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OurPartnersImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'OurPartners(id: $id, name: $name, description: $description, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OurPartnersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OurPartnersImplCopyWith<_$OurPartnersImpl> get copyWith =>
      __$$OurPartnersImplCopyWithImpl<_$OurPartnersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OurPartnersImplToJson(
      this,
    );
  }
}

abstract class _OurPartners implements OurPartners {
  const factory _OurPartners(
      {required final int? id,
      required final String? name,
      required final String? description,
      required final String? imagePath}) = _$OurPartnersImpl;

  factory _OurPartners.fromJson(Map<String, dynamic> json) =
      _$OurPartnersImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$OurPartnersImplCopyWith<_$OurPartnersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
