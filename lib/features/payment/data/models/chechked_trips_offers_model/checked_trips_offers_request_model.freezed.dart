// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checked_trips_offers_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckedTripsAndOffersRequest _$CheckedTripsAndOffersRequestFromJson(
    Map<String, dynamic> json) {
  return _CheckedTripsAndOffersRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckedTripsAndOffersRequest {
  String? get couponName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<SelectedData>? get selectedData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckedTripsAndOffersRequestCopyWith<CheckedTripsAndOffersRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckedTripsAndOffersRequestCopyWith<$Res> {
  factory $CheckedTripsAndOffersRequestCopyWith(
          CheckedTripsAndOffersRequest value,
          $Res Function(CheckedTripsAndOffersRequest) then) =
      _$CheckedTripsAndOffersRequestCopyWithImpl<$Res,
          CheckedTripsAndOffersRequest>;
  @useResult
  $Res call(
      {String? couponName,
      String? description,
      List<SelectedData>? selectedData});
}

/// @nodoc
class _$CheckedTripsAndOffersRequestCopyWithImpl<$Res,
        $Val extends CheckedTripsAndOffersRequest>
    implements $CheckedTripsAndOffersRequestCopyWith<$Res> {
  _$CheckedTripsAndOffersRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponName = freezed,
    Object? description = freezed,
    Object? selectedData = freezed,
  }) {
    return _then(_value.copyWith(
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedData: freezed == selectedData
          ? _value.selectedData
          : selectedData // ignore: cast_nullable_to_non_nullable
              as List<SelectedData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckedTripsAndOffersRequestImplCopyWith<$Res>
    implements $CheckedTripsAndOffersRequestCopyWith<$Res> {
  factory _$$CheckedTripsAndOffersRequestImplCopyWith(
          _$CheckedTripsAndOffersRequestImpl value,
          $Res Function(_$CheckedTripsAndOffersRequestImpl) then) =
      __$$CheckedTripsAndOffersRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? couponName,
      String? description,
      List<SelectedData>? selectedData});
}

/// @nodoc
class __$$CheckedTripsAndOffersRequestImplCopyWithImpl<$Res>
    extends _$CheckedTripsAndOffersRequestCopyWithImpl<$Res,
        _$CheckedTripsAndOffersRequestImpl>
    implements _$$CheckedTripsAndOffersRequestImplCopyWith<$Res> {
  __$$CheckedTripsAndOffersRequestImplCopyWithImpl(
      _$CheckedTripsAndOffersRequestImpl _value,
      $Res Function(_$CheckedTripsAndOffersRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponName = freezed,
    Object? description = freezed,
    Object? selectedData = freezed,
  }) {
    return _then(_$CheckedTripsAndOffersRequestImpl(
      couponName: freezed == couponName
          ? _value.couponName
          : couponName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedData: freezed == selectedData
          ? _value._selectedData
          : selectedData // ignore: cast_nullable_to_non_nullable
              as List<SelectedData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckedTripsAndOffersRequestImpl
    implements _CheckedTripsAndOffersRequest {
  const _$CheckedTripsAndOffersRequestImpl(
      {required this.couponName,
      required this.description,
      required final List<SelectedData>? selectedData})
      : _selectedData = selectedData;

  factory _$CheckedTripsAndOffersRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckedTripsAndOffersRequestImplFromJson(json);

  @override
  final String? couponName;
  @override
  final String? description;
  final List<SelectedData>? _selectedData;
  @override
  List<SelectedData>? get selectedData {
    final value = _selectedData;
    if (value == null) return null;
    if (_selectedData is EqualUnmodifiableListView) return _selectedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CheckedTripsAndOffersRequest(couponName: $couponName, description: $description, selectedData: $selectedData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckedTripsAndOffersRequestImpl &&
            (identical(other.couponName, couponName) ||
                other.couponName == couponName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._selectedData, _selectedData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, couponName, description,
      const DeepCollectionEquality().hash(_selectedData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckedTripsAndOffersRequestImplCopyWith<
          _$CheckedTripsAndOffersRequestImpl>
      get copyWith => __$$CheckedTripsAndOffersRequestImplCopyWithImpl<
          _$CheckedTripsAndOffersRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckedTripsAndOffersRequestImplToJson(
      this,
    );
  }
}

abstract class _CheckedTripsAndOffersRequest
    implements CheckedTripsAndOffersRequest {
  const factory _CheckedTripsAndOffersRequest(
          {required final String? couponName,
          required final String? description,
          required final List<SelectedData>? selectedData}) =
      _$CheckedTripsAndOffersRequestImpl;

  factory _CheckedTripsAndOffersRequest.fromJson(Map<String, dynamic> json) =
      _$CheckedTripsAndOffersRequestImpl.fromJson;

  @override
  String? get couponName;
  @override
  String? get description;
  @override
  List<SelectedData>? get selectedData;
  @override
  @JsonKey(ignore: true)
  _$$CheckedTripsAndOffersRequestImplCopyWith<
          _$CheckedTripsAndOffersRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
