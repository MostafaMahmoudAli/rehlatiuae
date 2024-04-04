// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewCount _$ReviewCountFromJson(Map<String, dynamic> json) {
  return _ReviewCount.fromJson(json);
}

/// @nodoc
mixin _$ReviewCount {
  @JsonKey(name: "one_star")
  int? get oneStar => throw _privateConstructorUsedError;
  @JsonKey(name: "tow_star")
  int? get towStar => throw _privateConstructorUsedError;
  @JsonKey(name: "three_star")
  int? get threeStar => throw _privateConstructorUsedError;
  @JsonKey(name: "four_star")
  int? get fourStar => throw _privateConstructorUsedError;
  @JsonKey(name: "five_star")
  int? get fiveStar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCountCopyWith<ReviewCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCountCopyWith<$Res> {
  factory $ReviewCountCopyWith(
          ReviewCount value, $Res Function(ReviewCount) then) =
      _$ReviewCountCopyWithImpl<$Res, ReviewCount>;
  @useResult
  $Res call(
      {@JsonKey(name: "one_star") int? oneStar,
      @JsonKey(name: "tow_star") int? towStar,
      @JsonKey(name: "three_star") int? threeStar,
      @JsonKey(name: "four_star") int? fourStar,
      @JsonKey(name: "five_star") int? fiveStar});
}

/// @nodoc
class _$ReviewCountCopyWithImpl<$Res, $Val extends ReviewCount>
    implements $ReviewCountCopyWith<$Res> {
  _$ReviewCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneStar = freezed,
    Object? towStar = freezed,
    Object? threeStar = freezed,
    Object? fourStar = freezed,
    Object? fiveStar = freezed,
  }) {
    return _then(_value.copyWith(
      oneStar: freezed == oneStar
          ? _value.oneStar
          : oneStar // ignore: cast_nullable_to_non_nullable
              as int?,
      towStar: freezed == towStar
          ? _value.towStar
          : towStar // ignore: cast_nullable_to_non_nullable
              as int?,
      threeStar: freezed == threeStar
          ? _value.threeStar
          : threeStar // ignore: cast_nullable_to_non_nullable
              as int?,
      fourStar: freezed == fourStar
          ? _value.fourStar
          : fourStar // ignore: cast_nullable_to_non_nullable
              as int?,
      fiveStar: freezed == fiveStar
          ? _value.fiveStar
          : fiveStar // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewCountImplCopyWith<$Res>
    implements $ReviewCountCopyWith<$Res> {
  factory _$$ReviewCountImplCopyWith(
          _$ReviewCountImpl value, $Res Function(_$ReviewCountImpl) then) =
      __$$ReviewCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "one_star") int? oneStar,
      @JsonKey(name: "tow_star") int? towStar,
      @JsonKey(name: "three_star") int? threeStar,
      @JsonKey(name: "four_star") int? fourStar,
      @JsonKey(name: "five_star") int? fiveStar});
}

/// @nodoc
class __$$ReviewCountImplCopyWithImpl<$Res>
    extends _$ReviewCountCopyWithImpl<$Res, _$ReviewCountImpl>
    implements _$$ReviewCountImplCopyWith<$Res> {
  __$$ReviewCountImplCopyWithImpl(
      _$ReviewCountImpl _value, $Res Function(_$ReviewCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneStar = freezed,
    Object? towStar = freezed,
    Object? threeStar = freezed,
    Object? fourStar = freezed,
    Object? fiveStar = freezed,
  }) {
    return _then(_$ReviewCountImpl(
      oneStar: freezed == oneStar
          ? _value.oneStar
          : oneStar // ignore: cast_nullable_to_non_nullable
              as int?,
      towStar: freezed == towStar
          ? _value.towStar
          : towStar // ignore: cast_nullable_to_non_nullable
              as int?,
      threeStar: freezed == threeStar
          ? _value.threeStar
          : threeStar // ignore: cast_nullable_to_non_nullable
              as int?,
      fourStar: freezed == fourStar
          ? _value.fourStar
          : fourStar // ignore: cast_nullable_to_non_nullable
              as int?,
      fiveStar: freezed == fiveStar
          ? _value.fiveStar
          : fiveStar // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCountImpl implements _ReviewCount {
  const _$ReviewCountImpl(
      {@JsonKey(name: "one_star") required this.oneStar,
      @JsonKey(name: "tow_star") required this.towStar,
      @JsonKey(name: "three_star") required this.threeStar,
      @JsonKey(name: "four_star") required this.fourStar,
      @JsonKey(name: "five_star") required this.fiveStar});

  factory _$ReviewCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCountImplFromJson(json);

  @override
  @JsonKey(name: "one_star")
  final int? oneStar;
  @override
  @JsonKey(name: "tow_star")
  final int? towStar;
  @override
  @JsonKey(name: "three_star")
  final int? threeStar;
  @override
  @JsonKey(name: "four_star")
  final int? fourStar;
  @override
  @JsonKey(name: "five_star")
  final int? fiveStar;

  @override
  String toString() {
    return 'ReviewCount(oneStar: $oneStar, towStar: $towStar, threeStar: $threeStar, fourStar: $fourStar, fiveStar: $fiveStar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCountImpl &&
            (identical(other.oneStar, oneStar) || other.oneStar == oneStar) &&
            (identical(other.towStar, towStar) || other.towStar == towStar) &&
            (identical(other.threeStar, threeStar) ||
                other.threeStar == threeStar) &&
            (identical(other.fourStar, fourStar) ||
                other.fourStar == fourStar) &&
            (identical(other.fiveStar, fiveStar) ||
                other.fiveStar == fiveStar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, oneStar, towStar, threeStar, fourStar, fiveStar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCountImplCopyWith<_$ReviewCountImpl> get copyWith =>
      __$$ReviewCountImplCopyWithImpl<_$ReviewCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCountImplToJson(
      this,
    );
  }
}

abstract class _ReviewCount implements ReviewCount {
  const factory _ReviewCount(
          {@JsonKey(name: "one_star") required final int? oneStar,
          @JsonKey(name: "tow_star") required final int? towStar,
          @JsonKey(name: "three_star") required final int? threeStar,
          @JsonKey(name: "four_star") required final int? fourStar,
          @JsonKey(name: "five_star") required final int? fiveStar}) =
      _$ReviewCountImpl;

  factory _ReviewCount.fromJson(Map<String, dynamic> json) =
      _$ReviewCountImpl.fromJson;

  @override
  @JsonKey(name: "one_star")
  int? get oneStar;
  @override
  @JsonKey(name: "tow_star")
  int? get towStar;
  @override
  @JsonKey(name: "three_star")
  int? get threeStar;
  @override
  @JsonKey(name: "four_star")
  int? get fourStar;
  @override
  @JsonKey(name: "five_star")
  int? get fiveStar;
  @override
  @JsonKey(ignore: true)
  _$$ReviewCountImplCopyWith<_$ReviewCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
