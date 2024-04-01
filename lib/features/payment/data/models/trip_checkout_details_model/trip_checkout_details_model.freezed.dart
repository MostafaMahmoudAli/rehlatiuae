// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_checkout_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripCheckoutDetails _$TripCheckoutDetailsFromJson(Map<String, dynamic> json) {
  return _TripCheckoutDetails.fromJson(json);
}

/// @nodoc
mixin _$TripCheckoutDetails {
  @JsonKey(name: "trip_id")
  int get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal_old")
  double get subtotalAdult => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity_old")
  int get quantityAdult => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal_child")
  double get subtotalChild => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity_young")
  int get quantityChild => throw _privateConstructorUsedError;
  @JsonKey(name: "final_subtotal")
  double get finalSubtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "coupon_name")
  String get couponName => throw _privateConstructorUsedError;
  @JsonKey(name: "discount")
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCheckoutDetailsCopyWith<TripCheckoutDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCheckoutDetailsCopyWith<$Res> {
  factory $TripCheckoutDetailsCopyWith(
          TripCheckoutDetails value, $Res Function(TripCheckoutDetails) then) =
      _$TripCheckoutDetailsCopyWithImpl<$Res, TripCheckoutDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int tripId,
      @JsonKey(name: "subtotal_old") double subtotalAdult,
      @JsonKey(name: "quantity_old") int quantityAdult,
      @JsonKey(name: "subtotal_child") double subtotalChild,
      @JsonKey(name: "quantity_young") int quantityChild,
      @JsonKey(name: "final_subtotal") double finalSubtotal,
      @JsonKey(name: "coupon_name") String couponName,
      @JsonKey(name: "discount") double discount,
      @JsonKey(name: "total") double total,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "description") String description});
}

/// @nodoc
class _$TripCheckoutDetailsCopyWithImpl<$Res, $Val extends TripCheckoutDetails>
    implements $TripCheckoutDetailsCopyWith<$Res> {
  _$TripCheckoutDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? subtotalAdult = null,
    Object? quantityAdult = null,
    Object? subtotalChild = null,
    Object? quantityChild = null,
    Object? finalSubtotal = null,
    Object? couponName = null,
    Object? discount = null,
    Object? total = null,
    Object? date = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalAdult: null == subtotalAdult
          ? _value.subtotalAdult
          : subtotalAdult // ignore: cast_nullable_to_non_nullable
              as double,
      quantityAdult: null == quantityAdult
          ? _value.quantityAdult
          : quantityAdult // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalChild: null == subtotalChild
          ? _value.subtotalChild
          : subtotalChild // ignore: cast_nullable_to_non_nullable
              as double,
      quantityChild: null == quantityChild
          ? _value.quantityChild
          : quantityChild // ignore: cast_nullable_to_non_nullable
              as int,
      finalSubtotal: null == finalSubtotal
          ? _value.finalSubtotal
          : finalSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripCheckoutDetailsImplCopyWith<$Res>
    implements $TripCheckoutDetailsCopyWith<$Res> {
  factory _$$TripCheckoutDetailsImplCopyWith(_$TripCheckoutDetailsImpl value,
          $Res Function(_$TripCheckoutDetailsImpl) then) =
      __$$TripCheckoutDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int tripId,
      @JsonKey(name: "subtotal_old") double subtotalAdult,
      @JsonKey(name: "quantity_old") int quantityAdult,
      @JsonKey(name: "subtotal_child") double subtotalChild,
      @JsonKey(name: "quantity_young") int quantityChild,
      @JsonKey(name: "final_subtotal") double finalSubtotal,
      @JsonKey(name: "coupon_name") String couponName,
      @JsonKey(name: "discount") double discount,
      @JsonKey(name: "total") double total,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "description") String description});
}

/// @nodoc
class __$$TripCheckoutDetailsImplCopyWithImpl<$Res>
    extends _$TripCheckoutDetailsCopyWithImpl<$Res, _$TripCheckoutDetailsImpl>
    implements _$$TripCheckoutDetailsImplCopyWith<$Res> {
  __$$TripCheckoutDetailsImplCopyWithImpl(_$TripCheckoutDetailsImpl _value,
      $Res Function(_$TripCheckoutDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? subtotalAdult = null,
    Object? quantityAdult = null,
    Object? subtotalChild = null,
    Object? quantityChild = null,
    Object? finalSubtotal = null,
    Object? couponName = null,
    Object? discount = null,
    Object? total = null,
    Object? date = null,
    Object? description = null,
  }) {
    return _then(_$TripCheckoutDetailsImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalAdult: null == subtotalAdult
          ? _value.subtotalAdult
          : subtotalAdult // ignore: cast_nullable_to_non_nullable
              as double,
      quantityAdult: null == quantityAdult
          ? _value.quantityAdult
          : quantityAdult // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalChild: null == subtotalChild
          ? _value.subtotalChild
          : subtotalChild // ignore: cast_nullable_to_non_nullable
              as double,
      quantityChild: null == quantityChild
          ? _value.quantityChild
          : quantityChild // ignore: cast_nullable_to_non_nullable
              as int,
      finalSubtotal: null == finalSubtotal
          ? _value.finalSubtotal
          : finalSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      couponName: null == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripCheckoutDetailsImpl implements _TripCheckoutDetails {
  const _$TripCheckoutDetailsImpl(
      {@JsonKey(name: "trip_id") required this.tripId,
      @JsonKey(name: "subtotal_old") required this.subtotalAdult,
      @JsonKey(name: "quantity_old") required this.quantityAdult,
      @JsonKey(name: "subtotal_child") required this.subtotalChild,
      @JsonKey(name: "quantity_young") required this.quantityChild,
      @JsonKey(name: "final_subtotal") required this.finalSubtotal,
      @JsonKey(name: "coupon_name") required this.couponName,
      @JsonKey(name: "discount") required this.discount,
      @JsonKey(name: "total") required this.total,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "description") required this.description});

  factory _$TripCheckoutDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripCheckoutDetailsImplFromJson(json);

  @override
  @JsonKey(name: "trip_id")
  final int tripId;
  @override
  @JsonKey(name: "subtotal_old")
  final double subtotalAdult;
  @override
  @JsonKey(name: "quantity_old")
  final int quantityAdult;
  @override
  @JsonKey(name: "subtotal_child")
  final double subtotalChild;
  @override
  @JsonKey(name: "quantity_young")
  final int quantityChild;
  @override
  @JsonKey(name: "final_subtotal")
  final double finalSubtotal;
  @override
  @JsonKey(name: "coupon_name")
  final String couponName;
  @override
  @JsonKey(name: "discount")
  final double discount;
  @override
  @JsonKey(name: "total")
  final double total;
  @override
  @JsonKey(name: "date")
  final String date;
  @override
  @JsonKey(name: "description")
  final String description;

  @override
  String toString() {
    return 'TripCheckoutDetails(tripId: $tripId, subtotalAdult: $subtotalAdult, quantityAdult: $quantityAdult, subtotalChild: $subtotalChild, quantityChild: $quantityChild, finalSubtotal: $finalSubtotal, couponName: $couponName, discount: $discount, total: $total, date: $date, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripCheckoutDetailsImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.subtotalAdult, subtotalAdult) ||
                other.subtotalAdult == subtotalAdult) &&
            (identical(other.quantityAdult, quantityAdult) ||
                other.quantityAdult == quantityAdult) &&
            (identical(other.subtotalChild, subtotalChild) ||
                other.subtotalChild == subtotalChild) &&
            (identical(other.quantityChild, quantityChild) ||
                other.quantityChild == quantityChild) &&
            (identical(other.finalSubtotal, finalSubtotal) ||
                other.finalSubtotal == finalSubtotal) &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tripId,
      subtotalAdult,
      quantityAdult,
      subtotalChild,
      quantityChild,
      finalSubtotal,
      couponName,
      discount,
      total,
      date,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripCheckoutDetailsImplCopyWith<_$TripCheckoutDetailsImpl> get copyWith =>
      __$$TripCheckoutDetailsImplCopyWithImpl<_$TripCheckoutDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripCheckoutDetailsImplToJson(
      this,
    );
  }
}

abstract class _TripCheckoutDetails implements TripCheckoutDetails {
  const factory _TripCheckoutDetails(
          {@JsonKey(name: "trip_id") required final int tripId,
          @JsonKey(name: "subtotal_old") required final double subtotalAdult,
          @JsonKey(name: "quantity_old") required final int quantityAdult,
          @JsonKey(name: "subtotal_child") required final double subtotalChild,
          @JsonKey(name: "quantity_young") required final int quantityChild,
          @JsonKey(name: "final_subtotal") required final double finalSubtotal,
          @JsonKey(name: "coupon_name") required final String couponName,
          @JsonKey(name: "discount") required final double discount,
          @JsonKey(name: "total") required final double total,
          @JsonKey(name: "date") required final String date,
          @JsonKey(name: "description") required final String description}) =
      _$TripCheckoutDetailsImpl;

  factory _TripCheckoutDetails.fromJson(Map<String, dynamic> json) =
      _$TripCheckoutDetailsImpl.fromJson;

  @override
  @JsonKey(name: "trip_id")
  int get tripId;
  @override
  @JsonKey(name: "subtotal_old")
  double get subtotalAdult;
  @override
  @JsonKey(name: "quantity_old")
  int get quantityAdult;
  @override
  @JsonKey(name: "subtotal_child")
  double get subtotalChild;
  @override
  @JsonKey(name: "quantity_young")
  int get quantityChild;
  @override
  @JsonKey(name: "final_subtotal")
  double get finalSubtotal;
  @override
  @JsonKey(name: "coupon_name")
  String get couponName;
  @override
  @JsonKey(name: "discount")
  double get discount;
  @override
  @JsonKey(name: "total")
  double get total;
  @override
  @JsonKey(name: "date")
  String get date;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$TripCheckoutDetailsImplCopyWith<_$TripCheckoutDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
