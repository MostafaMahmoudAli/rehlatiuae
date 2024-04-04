// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blogs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Blogs _$BlogsFromJson(Map<String, dynamic> json) {
  return _Blogs.fromJson(json);
}

/// @nodoc
mixin _$Blogs {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get reviewAverage => throw _privateConstructorUsedError;
  List<Review>? get blogReview => throw _privateConstructorUsedError;
  Trips? get trip => throw _privateConstructorUsedError;
  List<AddressModel> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: "review_count")
  ReviewCount get reviewCount => throw _privateConstructorUsedError;
  List<Attachment>? get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogsCopyWith<Blogs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogsCopyWith<$Res> {
  factory $BlogsCopyWith(Blogs value, $Res Function(Blogs) then) =
      _$BlogsCopyWithImpl<$Res, Blogs>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      @JsonKey(name: "created_at") DateTime? createdAt,
      int? reviewAverage,
      List<Review>? blogReview,
      Trips? trip,
      List<AddressModel> addresses,
      @JsonKey(name: "review_count") ReviewCount reviewCount,
      List<Attachment>? attachments});

  $TripsCopyWith<$Res>? get trip;
  $ReviewCountCopyWith<$Res> get reviewCount;
}

/// @nodoc
class _$BlogsCopyWithImpl<$Res, $Val extends Blogs>
    implements $BlogsCopyWith<$Res> {
  _$BlogsCopyWithImpl(this._value, this._then);

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
    Object? createdAt = freezed,
    Object? reviewAverage = freezed,
    Object? blogReview = freezed,
    Object? trip = freezed,
    Object? addresses = null,
    Object? reviewCount = null,
    Object? attachments = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewAverage: freezed == reviewAverage
          ? _value.reviewAverage
          : reviewAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      blogReview: freezed == blogReview
          ? _value.blogReview
          : blogReview // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trips?,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCount,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripsCopyWith<$Res>? get trip {
    if (_value.trip == null) {
      return null;
    }

    return $TripsCopyWith<$Res>(_value.trip!, (value) {
      return _then(_value.copyWith(trip: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewCountCopyWith<$Res> get reviewCount {
    return $ReviewCountCopyWith<$Res>(_value.reviewCount, (value) {
      return _then(_value.copyWith(reviewCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlogsImplCopyWith<$Res> implements $BlogsCopyWith<$Res> {
  factory _$$BlogsImplCopyWith(
          _$BlogsImpl value, $Res Function(_$BlogsImpl) then) =
      __$$BlogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? imagePath,
      @JsonKey(name: "created_at") DateTime? createdAt,
      int? reviewAverage,
      List<Review>? blogReview,
      Trips? trip,
      List<AddressModel> addresses,
      @JsonKey(name: "review_count") ReviewCount reviewCount,
      List<Attachment>? attachments});

  @override
  $TripsCopyWith<$Res>? get trip;
  @override
  $ReviewCountCopyWith<$Res> get reviewCount;
}

/// @nodoc
class __$$BlogsImplCopyWithImpl<$Res>
    extends _$BlogsCopyWithImpl<$Res, _$BlogsImpl>
    implements _$$BlogsImplCopyWith<$Res> {
  __$$BlogsImplCopyWithImpl(
      _$BlogsImpl _value, $Res Function(_$BlogsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? createdAt = freezed,
    Object? reviewAverage = freezed,
    Object? blogReview = freezed,
    Object? trip = freezed,
    Object? addresses = null,
    Object? reviewCount = null,
    Object? attachments = freezed,
  }) {
    return _then(_$BlogsImpl(
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewAverage: freezed == reviewAverage
          ? _value.reviewAverage
          : reviewAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      blogReview: freezed == blogReview
          ? _value._blogReview
          : blogReview // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trips?,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCount,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogsImpl implements _Blogs {
  const _$BlogsImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      @JsonKey(name: "created_at") required this.createdAt,
      required this.reviewAverage,
      required final List<Review>? blogReview,
      required this.trip,
      required final List<AddressModel> addresses,
      @JsonKey(name: "review_count") required this.reviewCount,
      final List<Attachment>? attachments})
      : _blogReview = blogReview,
        _addresses = addresses,
        _attachments = attachments;

  factory _$BlogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? imagePath;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  final int? reviewAverage;
  final List<Review>? _blogReview;
  @override
  List<Review>? get blogReview {
    final value = _blogReview;
    if (value == null) return null;
    if (_blogReview is EqualUnmodifiableListView) return _blogReview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Trips? trip;
  final List<AddressModel> _addresses;
  @override
  List<AddressModel> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey(name: "review_count")
  final ReviewCount reviewCount;
  final List<Attachment>? _attachments;
  @override
  List<Attachment>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Blogs(id: $id, name: $name, description: $description, imagePath: $imagePath, createdAt: $createdAt, reviewAverage: $reviewAverage, blogReview: $blogReview, trip: $trip, addresses: $addresses, reviewCount: $reviewCount, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewAverage, reviewAverage) ||
                other.reviewAverage == reviewAverage) &&
            const DeepCollectionEquality()
                .equals(other._blogReview, _blogReview) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imagePath,
      createdAt,
      reviewAverage,
      const DeepCollectionEquality().hash(_blogReview),
      trip,
      const DeepCollectionEquality().hash(_addresses),
      reviewCount,
      const DeepCollectionEquality().hash(_attachments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogsImplCopyWith<_$BlogsImpl> get copyWith =>
      __$$BlogsImplCopyWithImpl<_$BlogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogsImplToJson(
      this,
    );
  }
}

abstract class _Blogs implements Blogs {
  const factory _Blogs(
      {required final int? id,
      required final String? name,
      required final String? description,
      required final String? imagePath,
      @JsonKey(name: "created_at") required final DateTime? createdAt,
      required final int? reviewAverage,
      required final List<Review>? blogReview,
      required final Trips? trip,
      required final List<AddressModel> addresses,
      @JsonKey(name: "review_count") required final ReviewCount reviewCount,
      final List<Attachment>? attachments}) = _$BlogsImpl;

  factory _Blogs.fromJson(Map<String, dynamic> json) = _$BlogsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get imagePath;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  int? get reviewAverage;
  @override
  List<Review>? get blogReview;
  @override
  Trips? get trip;
  @override
  List<AddressModel> get addresses;
  @override
  @JsonKey(name: "review_count")
  ReviewCount get reviewCount;
  @override
  List<Attachment>? get attachments;
  @override
  @JsonKey(ignore: true)
  _$$BlogsImplCopyWith<_$BlogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
