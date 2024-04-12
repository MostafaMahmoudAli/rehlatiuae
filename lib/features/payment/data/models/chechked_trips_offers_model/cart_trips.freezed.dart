// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_trips.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartTrips _$CartTripsFromJson(Map<String, dynamic> json) {
  return _CartTrips.fromJson(json);
}

/// @nodoc
mixin _$CartTrips {
  int? get id => throw _privateConstructorUsedError;
  int? get checkoutId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get quantityAdult => throw _privateConstructorUsedError;
  int? get priceAdult => throw _privateConstructorUsedError;
  int? get subtotalAdult => throw _privateConstructorUsedError;
  int? get quantityChildren => throw _privateConstructorUsedError;
  int? get priceChildren => throw _privateConstructorUsedError;
  int? get subtotalChildren => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  Trips? get trip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartTripsCopyWith<CartTrips> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTripsCopyWith<$Res> {
  factory $CartTripsCopyWith(CartTrips value, $Res Function(CartTrips) then) =
      _$CartTripsCopyWithImpl<$Res, CartTrips>;
  @useResult
  $Res call(
      {int? id,
      int? checkoutId,
      String? date,
      String? status,
      int? quantityAdult,
      int? priceAdult,
      int? subtotalAdult,
      int? quantityChildren,
      int? priceChildren,
      int? subtotalChildren,
      int? total,
      Trips? trip});

  $TripsCopyWith<$Res>? get trip;
}

/// @nodoc
class _$CartTripsCopyWithImpl<$Res, $Val extends CartTrips>
    implements $CartTripsCopyWith<$Res> {
  _$CartTripsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? checkoutId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? quantityAdult = freezed,
    Object? priceAdult = freezed,
    Object? subtotalAdult = freezed,
    Object? quantityChildren = freezed,
    Object? priceChildren = freezed,
    Object? subtotalChildren = freezed,
    Object? total = freezed,
    Object? trip = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      checkoutId: freezed == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityAdult: freezed == quantityAdult
          ? _value.quantityAdult
          : quantityAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      priceAdult: freezed == priceAdult
          ? _value.priceAdult
          : priceAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotalAdult: freezed == subtotalAdult
          ? _value.subtotalAdult
          : subtotalAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityChildren: freezed == quantityChildren
          ? _value.quantityChildren
          : quantityChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      priceChildren: freezed == priceChildren
          ? _value.priceChildren
          : priceChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotalChildren: freezed == subtotalChildren
          ? _value.subtotalChildren
          : subtotalChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trips?,
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
}

/// @nodoc
abstract class _$$CartTripsImplCopyWith<$Res>
    implements $CartTripsCopyWith<$Res> {
  factory _$$CartTripsImplCopyWith(
          _$CartTripsImpl value, $Res Function(_$CartTripsImpl) then) =
      __$$CartTripsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? checkoutId,
      String? date,
      String? status,
      int? quantityAdult,
      int? priceAdult,
      int? subtotalAdult,
      int? quantityChildren,
      int? priceChildren,
      int? subtotalChildren,
      int? total,
      Trips? trip});

  @override
  $TripsCopyWith<$Res>? get trip;
}

/// @nodoc
class __$$CartTripsImplCopyWithImpl<$Res>
    extends _$CartTripsCopyWithImpl<$Res, _$CartTripsImpl>
    implements _$$CartTripsImplCopyWith<$Res> {
  __$$CartTripsImplCopyWithImpl(
      _$CartTripsImpl _value, $Res Function(_$CartTripsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? checkoutId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? quantityAdult = freezed,
    Object? priceAdult = freezed,
    Object? subtotalAdult = freezed,
    Object? quantityChildren = freezed,
    Object? priceChildren = freezed,
    Object? subtotalChildren = freezed,
    Object? total = freezed,
    Object? trip = freezed,
  }) {
    return _then(_$CartTripsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      checkoutId: freezed == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityAdult: freezed == quantityAdult
          ? _value.quantityAdult
          : quantityAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      priceAdult: freezed == priceAdult
          ? _value.priceAdult
          : priceAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotalAdult: freezed == subtotalAdult
          ? _value.subtotalAdult
          : subtotalAdult // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityChildren: freezed == quantityChildren
          ? _value.quantityChildren
          : quantityChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      priceChildren: freezed == priceChildren
          ? _value.priceChildren
          : priceChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotalChildren: freezed == subtotalChildren
          ? _value.subtotalChildren
          : subtotalChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trips?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTripsImpl implements _CartTrips {
  const _$CartTripsImpl(
      {required this.id,
      required this.checkoutId,
      required this.date,
      required this.status,
      required this.quantityAdult,
      required this.priceAdult,
      required this.subtotalAdult,
      required this.quantityChildren,
      required this.priceChildren,
      required this.subtotalChildren,
      required this.total,
      required this.trip});

  factory _$CartTripsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTripsImplFromJson(json);

  @override
  final int? id;
  @override
  final int? checkoutId;
  @override
  final String? date;
  @override
  final String? status;
  @override
  final int? quantityAdult;
  @override
  final int? priceAdult;
  @override
  final int? subtotalAdult;
  @override
  final int? quantityChildren;
  @override
  final int? priceChildren;
  @override
  final int? subtotalChildren;
  @override
  final int? total;
  @override
  final Trips? trip;

  @override
  String toString() {
    return 'CartTrips(id: $id, checkoutId: $checkoutId, date: $date, status: $status, quantityAdult: $quantityAdult, priceAdult: $priceAdult, subtotalAdult: $subtotalAdult, quantityChildren: $quantityChildren, priceChildren: $priceChildren, subtotalChildren: $subtotalChildren, total: $total, trip: $trip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTripsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantityAdult, quantityAdult) ||
                other.quantityAdult == quantityAdult) &&
            (identical(other.priceAdult, priceAdult) ||
                other.priceAdult == priceAdult) &&
            (identical(other.subtotalAdult, subtotalAdult) ||
                other.subtotalAdult == subtotalAdult) &&
            (identical(other.quantityChildren, quantityChildren) ||
                other.quantityChildren == quantityChildren) &&
            (identical(other.priceChildren, priceChildren) ||
                other.priceChildren == priceChildren) &&
            (identical(other.subtotalChildren, subtotalChildren) ||
                other.subtotalChildren == subtotalChildren) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      checkoutId,
      date,
      status,
      quantityAdult,
      priceAdult,
      subtotalAdult,
      quantityChildren,
      priceChildren,
      subtotalChildren,
      total,
      trip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTripsImplCopyWith<_$CartTripsImpl> get copyWith =>
      __$$CartTripsImplCopyWithImpl<_$CartTripsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTripsImplToJson(
      this,
    );
  }
}

abstract class _CartTrips implements CartTrips {
  const factory _CartTrips(
      {required final int? id,
      required final int? checkoutId,
      required final String? date,
      required final String? status,
      required final int? quantityAdult,
      required final int? priceAdult,
      required final int? subtotalAdult,
      required final int? quantityChildren,
      required final int? priceChildren,
      required final int? subtotalChildren,
      required final int? total,
      required final Trips? trip}) = _$CartTripsImpl;

  factory _CartTrips.fromJson(Map<String, dynamic> json) =
      _$CartTripsImpl.fromJson;

  @override
  int? get id;
  @override
  int? get checkoutId;
  @override
  String? get date;
  @override
  String? get status;
  @override
  int? get quantityAdult;
  @override
  int? get priceAdult;
  @override
  int? get subtotalAdult;
  @override
  int? get quantityChildren;
  @override
  int? get priceChildren;
  @override
  int? get subtotalChildren;
  @override
  int? get total;
  @override
  Trips? get trip;
  @override
  @JsonKey(ignore: true)
  _$$CartTripsImplCopyWith<_$CartTripsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
