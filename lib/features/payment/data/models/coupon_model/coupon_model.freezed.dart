// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_name")
  String get couponName => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_amount")
  int get couponAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_start")
  String get couponStart => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_end")
  String get couponEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "coupon_name") String couponName,
      @JsonKey(name: "coupon_amount") int couponAmount,
      @JsonKey(name: "coupon_start") String couponStart,
      @JsonKey(name: "coupon_end") String couponEnd});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couponName = null,
    Object? couponAmount = null,
    Object? couponStart = null,
    Object? couponEnd = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      couponAmount: null == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as int,
      couponStart: null == couponStart
          ? _value.couponStart
          : couponStart // ignore: cast_nullable_to_non_nullable
              as String,
      couponEnd: null == couponEnd
          ? _value.couponEnd
          : couponEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponImplCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$CouponImplCopyWith(
          _$CouponImpl value, $Res Function(_$CouponImpl) then) =
      __$$CouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "coupon_name") String couponName,
      @JsonKey(name: "coupon_amount") int couponAmount,
      @JsonKey(name: "coupon_start") String couponStart,
      @JsonKey(name: "coupon_end") String couponEnd});
}

/// @nodoc
class __$$CouponImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponImpl>
    implements _$$CouponImplCopyWith<$Res> {
  __$$CouponImplCopyWithImpl(
      _$CouponImpl _value, $Res Function(_$CouponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couponName = null,
    Object? couponAmount = null,
    Object? couponStart = null,
    Object? couponEnd = null,
  }) {
    return _then(_$CouponImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      couponAmount: null == couponAmount
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as int,
      couponStart: null == couponStart
          ? _value.couponStart
          : couponStart // ignore: cast_nullable_to_non_nullable
              as String,
      couponEnd: null == couponEnd
          ? _value.couponEnd
          : couponEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponImpl implements _Coupon {
  const _$CouponImpl(
      {required this.id,
      @JsonKey(name: "coupon_name") required this.couponName,
      @JsonKey(name: "coupon_amount") required this.couponAmount,
      @JsonKey(name: "coupon_start") required this.couponStart,
      @JsonKey(name: "coupon_end") required this.couponEnd});

  factory _$CouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "coupon_name")
  final String couponName;
  @override
  @JsonKey(name: "coupon_amount")
  final int couponAmount;
  @override
  @JsonKey(name: "coupon_start")
  final String couponStart;
  @override
  @JsonKey(name: "coupon_end")
  final String couponEnd;

  @override
  String toString() {
    return 'Coupon(id: $id, couponName: $couponName, couponAmount: $couponAmount, couponStart: $couponStart, couponEnd: $couponEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.couponAmount, couponAmount) ||
                other.couponAmount == couponAmount) &&
            (identical(other.couponStart, couponStart) ||
                other.couponStart == couponStart) &&
            (identical(other.couponEnd, couponEnd) ||
                other.couponEnd == couponEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, couponName, couponAmount, couponStart, couponEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      __$$CouponImplCopyWithImpl<_$CouponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponImplToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  const factory _Coupon(
          {required final int id,
          @JsonKey(name: "coupon_name") required final String couponName,
          @JsonKey(name: "coupon_amount") required final int couponAmount,
          @JsonKey(name: "coupon_start") required final String couponStart,
          @JsonKey(name: "coupon_end") required final String couponEnd}) =
      _$CouponImpl;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$CouponImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "coupon_name")
  String get couponName;
  @override
  @JsonKey(name: "coupon_amount")
  int get couponAmount;
  @override
  @JsonKey(name: "coupon_start")
  String get couponStart;
  @override
  @JsonKey(name: "coupon_end")
  String get couponEnd;
  @override
  @JsonKey(ignore: true)
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
