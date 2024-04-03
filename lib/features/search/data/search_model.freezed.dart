// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _Search.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "oldPrice")
  int? get adultPrice => throw _privateConstructorUsedError;
  int? get childPrice => throw _privateConstructorUsedError;
  dynamic get beforePrice => throw _privateConstructorUsedError;
  dynamic get saving => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  List<AddressModel>? get addresses => throw _privateConstructorUsedError;
  List<ImagesModel>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      @JsonKey(name: "oldPrice") int? adultPrice,
      int? childPrice,
      dynamic beforePrice,
      dynamic saving,
      String? imagePath,
      List<AddressModel>? addresses,
      List<ImagesModel>? images});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? adultPrice = freezed,
    Object? childPrice = freezed,
    Object? beforePrice = freezed,
    Object? saving = freezed,
    Object? imagePath = freezed,
    Object? addresses = freezed,
    Object? images = freezed,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      adultPrice: freezed == adultPrice
          ? _value.adultPrice
          : adultPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      childPrice: freezed == childPrice
          ? _value.childPrice
          : childPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      beforePrice: freezed == beforePrice
          ? _value.beforePrice
          : beforePrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      saving: freezed == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      @JsonKey(name: "oldPrice") int? adultPrice,
      int? childPrice,
      dynamic beforePrice,
      dynamic saving,
      String? imagePath,
      List<AddressModel>? addresses,
      List<ImagesModel>? images});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? adultPrice = freezed,
    Object? childPrice = freezed,
    Object? beforePrice = freezed,
    Object? saving = freezed,
    Object? imagePath = freezed,
    Object? addresses = freezed,
    Object? images = freezed,
  }) {
    return _then(_$SearchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      adultPrice: freezed == adultPrice
          ? _value.adultPrice
          : adultPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      childPrice: freezed == childPrice
          ? _value.childPrice
          : childPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      beforePrice: freezed == beforePrice
          ? _value.beforePrice
          : beforePrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      saving: freezed == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchImpl implements _Search {
  const _$SearchImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.description,
      @JsonKey(name: "oldPrice") required this.adultPrice,
      required this.childPrice,
      required this.beforePrice,
      required this.saving,
      this.imagePath,
      required final List<AddressModel>? addresses,
      required final List<ImagesModel>? images})
      : _addresses = addresses,
        _images = images;

  factory _$SearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? description;
  @override
  @JsonKey(name: "oldPrice")
  final int? adultPrice;
  @override
  final int? childPrice;
  @override
  final dynamic beforePrice;
  @override
  final dynamic saving;
  @override
  final String? imagePath;
  final List<AddressModel>? _addresses;
  @override
  List<AddressModel>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ImagesModel>? _images;
  @override
  List<ImagesModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchModel(id: $id, name: $name, address: $address, description: $description, adultPrice: $adultPrice, childPrice: $childPrice, beforePrice: $beforePrice, saving: $saving, imagePath: $imagePath, addresses: $addresses, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.adultPrice, adultPrice) ||
                other.adultPrice == adultPrice) &&
            (identical(other.childPrice, childPrice) ||
                other.childPrice == childPrice) &&
            const DeepCollectionEquality()
                .equals(other.beforePrice, beforePrice) &&
            const DeepCollectionEquality().equals(other.saving, saving) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      description,
      adultPrice,
      childPrice,
      const DeepCollectionEquality().hash(beforePrice),
      const DeepCollectionEquality().hash(saving),
      imagePath,
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchImplToJson(
      this,
    );
  }
}

abstract class _Search implements SearchModel {
  const factory _Search(
      {required final int? id,
      required final String? name,
      required final String? address,
      required final String? description,
      @JsonKey(name: "oldPrice") required final int? adultPrice,
      required final int? childPrice,
      required final dynamic beforePrice,
      required final dynamic saving,
      final String? imagePath,
      required final List<AddressModel>? addresses,
      required final List<ImagesModel>? images}) = _$SearchImpl;

  factory _Search.fromJson(Map<String, dynamic> json) = _$SearchImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get description;
  @override
  @JsonKey(name: "oldPrice")
  int? get adultPrice;
  @override
  int? get childPrice;
  @override
  dynamic get beforePrice;
  @override
  dynamic get saving;
  @override
  String? get imagePath;
  @override
  List<AddressModel>? get addresses;
  @override
  List<ImagesModel>? get images;
  @override
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
