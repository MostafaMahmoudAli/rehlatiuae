// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_trips_offers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckTripsAndOffersResponse _$CheckTripsAndOffersResponseFromJson(
    Map<String, dynamic> json) {
  return _CheckTripsAndOffersResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckTripsAndOffersResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get subtotal => throw _privateConstructorUsedError;
  String? get couponName => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  CartTrips? get cartTrip => throw _privateConstructorUsedError;
  List<dynamic>? get cartOffers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckTripsAndOffersResponseCopyWith<CheckTripsAndOffersResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckTripsAndOffersResponseCopyWith<$Res> {
  factory $CheckTripsAndOffersResponseCopyWith(
          CheckTripsAndOffersResponse value,
          $Res Function(CheckTripsAndOffersResponse) then) =
      _$CheckTripsAndOffersResponseCopyWithImpl<$Res,
          CheckTripsAndOffersResponse>;
  @useResult
  $Res call(
      {int? id,
      String? status,
      int? subtotal,
      String? couponName,
      int? discount,
      int? total,
      Client? client,
      CartTrips? cartTrip,
      List<dynamic>? cartOffers});

  $ClientCopyWith<$Res>? get client;
  $CartTripsCopyWith<$Res>? get cartTrip;
}

/// @nodoc
class _$CheckTripsAndOffersResponseCopyWithImpl<$Res,
        $Val extends CheckTripsAndOffersResponse>
    implements $CheckTripsAndOffersResponseCopyWith<$Res> {
  _$CheckTripsAndOffersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? couponName = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? client = freezed,
    Object? cartTrip = freezed,
    Object? cartOffers = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int?,
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      cartTrip: freezed == cartTrip
          ? _value.cartTrip
          : cartTrip // ignore: cast_nullable_to_non_nullable
              as CartTrips?,
      cartOffers: freezed == cartOffers
          ? _value.cartOffers
          : cartOffers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_value.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_value.client!, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CartTripsCopyWith<$Res>? get cartTrip {
    if (_value.cartTrip == null) {
      return null;
    }

    return $CartTripsCopyWith<$Res>(_value.cartTrip!, (value) {
      return _then(_value.copyWith(cartTrip: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckTripsAndOffersResponseImplCopyWith<$Res>
    implements $CheckTripsAndOffersResponseCopyWith<$Res> {
  factory _$$CheckTripsAndOffersResponseImplCopyWith(
          _$CheckTripsAndOffersResponseImpl value,
          $Res Function(_$CheckTripsAndOffersResponseImpl) then) =
      __$$CheckTripsAndOffersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? status,
      int? subtotal,
      String? couponName,
      int? discount,
      int? total,
      Client? client,
      CartTrips? cartTrip,
      List<dynamic>? cartOffers});

  @override
  $ClientCopyWith<$Res>? get client;
  @override
  $CartTripsCopyWith<$Res>? get cartTrip;
}

/// @nodoc
class __$$CheckTripsAndOffersResponseImplCopyWithImpl<$Res>
    extends _$CheckTripsAndOffersResponseCopyWithImpl<$Res,
        _$CheckTripsAndOffersResponseImpl>
    implements _$$CheckTripsAndOffersResponseImplCopyWith<$Res> {
  __$$CheckTripsAndOffersResponseImplCopyWithImpl(
      _$CheckTripsAndOffersResponseImpl _value,
      $Res Function(_$CheckTripsAndOffersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? couponName = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? client = freezed,
    Object? cartTrip = freezed,
    Object? cartOffers = freezed,
  }) {
    return _then(_$CheckTripsAndOffersResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int?,
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      cartTrip: freezed == cartTrip
          ? _value.cartTrip
          : cartTrip // ignore: cast_nullable_to_non_nullable
              as CartTrips?,
      cartOffers: freezed == cartOffers
          ? _value._cartOffers
          : cartOffers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckTripsAndOffersResponseImpl
    implements _CheckTripsAndOffersResponse {
  const _$CheckTripsAndOffersResponseImpl(
      {required this.id,
      required this.status,
      required this.subtotal,
      required this.couponName,
      required this.discount,
      required this.total,
      required this.client,
      required this.cartTrip,
      required final List<dynamic>? cartOffers})
      : _cartOffers = cartOffers;

  factory _$CheckTripsAndOffersResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckTripsAndOffersResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? status;
  @override
  final int? subtotal;
  @override
  final String? couponName;
  @override
  final int? discount;
  @override
  final int? total;
  @override
  final Client? client;
  @override
  final CartTrips? cartTrip;
  final List<dynamic>? _cartOffers;
  @override
  List<dynamic>? get cartOffers {
    final value = _cartOffers;
    if (value == null) return null;
    if (_cartOffers is EqualUnmodifiableListView) return _cartOffers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CheckTripsAndOffersResponse(id: $id, status: $status, subtotal: $subtotal, couponName: $couponName, discount: $discount, total: $total, client: $client, cartTrip: $cartTrip, cartOffers: $cartOffers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckTripsAndOffersResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.cartTrip, cartTrip) ||
                other.cartTrip == cartTrip) &&
            const DeepCollectionEquality()
                .equals(other._cartOffers, _cartOffers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      subtotal,
      couponName,
      discount,
      total,
      client,
      cartTrip,
      const DeepCollectionEquality().hash(_cartOffers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckTripsAndOffersResponseImplCopyWith<_$CheckTripsAndOffersResponseImpl>
      get copyWith => __$$CheckTripsAndOffersResponseImplCopyWithImpl<
          _$CheckTripsAndOffersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckTripsAndOffersResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckTripsAndOffersResponse
    implements CheckTripsAndOffersResponse {
  const factory _CheckTripsAndOffersResponse(
          {required final int? id,
          required final String? status,
          required final int? subtotal,
          required final String? couponName,
          required final int? discount,
          required final int? total,
          required final Client? client,
          required final CartTrips? cartTrip,
          required final List<dynamic>? cartOffers}) =
      _$CheckTripsAndOffersResponseImpl;

  factory _CheckTripsAndOffersResponse.fromJson(Map<String, dynamic> json) =
      _$CheckTripsAndOffersResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get status;
  @override
  int? get subtotal;
  @override
  String? get couponName;
  @override
  int? get discount;
  @override
  int? get total;
  @override
  Client? get client;
  @override
  CartTrips? get cartTrip;
  @override
  List<dynamic>? get cartOffers;
  @override
  @JsonKey(ignore: true)
  _$$CheckTripsAndOffersResponseImplCopyWith<_$CheckTripsAndOffersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
