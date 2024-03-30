// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) {
  return _ReviewRequest.fromJson(json);
}

/// @nodoc
mixin _$ReviewRequest {
  String get name => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  @JsonKey(name: "stars_numbers")
  int get starsNumbers => throw _privateConstructorUsedError;

  @JsonKey(name: "image_path")
  String get imagePath => throw _privateConstructorUsedError;

  @JsonKey(name: "trip_id")
  int get tripId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewRequestCopyWith<ReviewRequest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(ReviewRequest value, $Res Function(ReviewRequest) then) =
      _$ReviewRequestCopyWithImpl<$Res, ReviewRequest>;

  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: "stars_numbers") int starsNumbers,
      @JsonKey(name: "image_path") String imagePath,
      @JsonKey(name: "trip_id") int tripId});
}

/// @nodoc
class _$ReviewRequestCopyWithImpl<$Res, $Val extends ReviewRequest> implements $ReviewRequestCopyWith<$Res> {
  _$ReviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? starsNumbers = null,
    Object? imagePath = null,
    Object? tripId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starsNumbers: null == starsNumbers
          ? _value.starsNumbers
          : starsNumbers // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewRequestImplCopyWith<$Res> implements $ReviewRequestCopyWith<$Res> {
  factory _$$ReviewRequestImplCopyWith(_$ReviewRequestImpl value, $Res Function(_$ReviewRequestImpl) then) =
      __$$ReviewRequestImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: "stars_numbers") int starsNumbers,
      @JsonKey(name: "image_path") String imagePath,
      @JsonKey(name: "trip_id") int tripId});
}

/// @nodoc
class __$$ReviewRequestImplCopyWithImpl<$Res> extends _$ReviewRequestCopyWithImpl<$Res, _$ReviewRequestImpl>
    implements _$$ReviewRequestImplCopyWith<$Res> {
  __$$ReviewRequestImplCopyWithImpl(_$ReviewRequestImpl _value, $Res Function(_$ReviewRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? starsNumbers = null,
    Object? imagePath = null,
    Object? tripId = null,
  }) {
    return _then(_$ReviewRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starsNumbers: null == starsNumbers
          ? _value.starsNumbers
          : starsNumbers // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewRequestImpl implements _ReviewRequest {
  const _$ReviewRequestImpl(
      {required this.name,
      required this.description,
      @JsonKey(name: "stars_numbers") required this.starsNumbers,
      @JsonKey(name: "image_path") required this.imagePath,
      @JsonKey(name: "trip_id") required this.tripId});

  factory _$ReviewRequestImpl.fromJson(Map<String, dynamic> json) => _$$ReviewRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: "stars_numbers")
  final int starsNumbers;
  @override
  @JsonKey(name: "image_path")
  final String imagePath;
  @override
  @JsonKey(name: "trip_id")
  final int tripId;

  @override
  String toString() {
    return 'ReviewRequest(name: $name, description: $description, starsNumbers: $starsNumbers, imagePath: $imagePath, tripId: $tripId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.starsNumbers, starsNumbers) || other.starsNumbers == starsNumbers) &&
            (identical(other.imagePath, imagePath) || other.imagePath == imagePath) &&
            (identical(other.tripId, tripId) || other.tripId == tripId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, starsNumbers, imagePath, tripId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith =>
      __$$ReviewRequestImplCopyWithImpl<_$ReviewRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewRequestImplToJson(
      this,
    );
  }
}

abstract class _ReviewRequest implements ReviewRequest {
  const factory _ReviewRequest(
      {required final String name,
      required final String description,
      @JsonKey(name: "stars_numbers") required final int starsNumbers,
      @JsonKey(name: "image_path") required final String imagePath,
      @JsonKey(name: "trip_id") required final int tripId}) = _$ReviewRequestImpl;

  factory _ReviewRequest.fromJson(Map<String, dynamic> json) = _$ReviewRequestImpl.fromJson;

  @override
  String get name;

  @override
  String get description;

  @override
  @JsonKey(name: "stars_numbers")
  int get starsNumbers;

  @override
  @JsonKey(name: "image_path")
  String get imagePath;

  @override
  @JsonKey(name: "trip_id")
  int get tripId;

  @override
  @JsonKey(ignore: true)
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith => throw _privateConstructorUsedError;
}
