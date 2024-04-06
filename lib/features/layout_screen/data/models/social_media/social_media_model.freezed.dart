// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) {
  return _SocialMedia.fromJson(json);
}

/// @nodoc
mixin _$SocialMedia {
  int get id => throw _privateConstructorUsedError;
  String get whatsApp => throw _privateConstructorUsedError;
  String get facebook => throw _privateConstructorUsedError;
  String get youtube => throw _privateConstructorUsedError;
  String get twitter => throw _privateConstructorUsedError;
  String get instagram => throw _privateConstructorUsedError;
  String get linkedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialMediaCopyWith<SocialMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaCopyWith<$Res> {
  factory $SocialMediaCopyWith(
          SocialMedia value, $Res Function(SocialMedia) then) =
      _$SocialMediaCopyWithImpl<$Res, SocialMedia>;
  @useResult
  $Res call(
      {int id,
      String whatsApp,
      String facebook,
      String youtube,
      String twitter,
      String instagram,
      String linkedIn});
}

/// @nodoc
class _$SocialMediaCopyWithImpl<$Res, $Val extends SocialMedia>
    implements $SocialMediaCopyWith<$Res> {
  _$SocialMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? whatsApp = null,
    Object? facebook = null,
    Object? youtube = null,
    Object? twitter = null,
    Object? instagram = null,
    Object? linkedIn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      whatsApp: null == whatsApp
          ? _value.whatsApp
          : whatsApp // ignore: cast_nullable_to_non_nullable
              as String,
      facebook: null == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String,
      youtube: null == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: null == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      linkedIn: null == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaImplCopyWith<$Res>
    implements $SocialMediaCopyWith<$Res> {
  factory _$$SocialMediaImplCopyWith(
          _$SocialMediaImpl value, $Res Function(_$SocialMediaImpl) then) =
      __$$SocialMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String whatsApp,
      String facebook,
      String youtube,
      String twitter,
      String instagram,
      String linkedIn});
}

/// @nodoc
class __$$SocialMediaImplCopyWithImpl<$Res>
    extends _$SocialMediaCopyWithImpl<$Res, _$SocialMediaImpl>
    implements _$$SocialMediaImplCopyWith<$Res> {
  __$$SocialMediaImplCopyWithImpl(
      _$SocialMediaImpl _value, $Res Function(_$SocialMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? whatsApp = null,
    Object? facebook = null,
    Object? youtube = null,
    Object? twitter = null,
    Object? instagram = null,
    Object? linkedIn = null,
  }) {
    return _then(_$SocialMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      whatsApp: null == whatsApp
          ? _value.whatsApp
          : whatsApp // ignore: cast_nullable_to_non_nullable
              as String,
      facebook: null == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String,
      youtube: null == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: null == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      linkedIn: null == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaImpl implements _SocialMedia {
  const _$SocialMediaImpl(
      {required this.id,
      required this.whatsApp,
      required this.facebook,
      required this.youtube,
      required this.twitter,
      required this.instagram,
      required this.linkedIn});

  factory _$SocialMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialMediaImplFromJson(json);

  @override
  final int id;
  @override
  final String whatsApp;
  @override
  final String facebook;
  @override
  final String youtube;
  @override
  final String twitter;
  @override
  final String instagram;
  @override
  final String linkedIn;

  @override
  String toString() {
    return 'SocialMedia(id: $id, whatsApp: $whatsApp, facebook: $facebook, youtube: $youtube, twitter: $twitter, instagram: $instagram, linkedIn: $linkedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.whatsApp, whatsApp) ||
                other.whatsApp == whatsApp) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.youtube, youtube) || other.youtube == youtube) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.linkedIn, linkedIn) ||
                other.linkedIn == linkedIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, whatsApp, facebook, youtube,
      twitter, instagram, linkedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaImplCopyWith<_$SocialMediaImpl> get copyWith =>
      __$$SocialMediaImplCopyWithImpl<_$SocialMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaImplToJson(
      this,
    );
  }
}

abstract class _SocialMedia implements SocialMedia {
  const factory _SocialMedia(
      {required final int id,
      required final String whatsApp,
      required final String facebook,
      required final String youtube,
      required final String twitter,
      required final String instagram,
      required final String linkedIn}) = _$SocialMediaImpl;

  factory _SocialMedia.fromJson(Map<String, dynamic> json) =
      _$SocialMediaImpl.fromJson;

  @override
  int get id;
  @override
  String get whatsApp;
  @override
  String get facebook;
  @override
  String get youtube;
  @override
  String get twitter;
  @override
  String get instagram;
  @override
  String get linkedIn;
  @override
  @JsonKey(ignore: true)
  _$$SocialMediaImplCopyWith<_$SocialMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
