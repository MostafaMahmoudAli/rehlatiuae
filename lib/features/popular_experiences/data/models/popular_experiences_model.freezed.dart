// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_experiences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopularExperiences _$PopularExperiencesFromJson(Map<String, dynamic> json) {
  return _PopularExperiences.fromJson(json);
}

/// @nodoc
mixin _$PopularExperiences {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "oldPrice")
  int? get adultPrice => throw _privateConstructorUsedError;
  int? get childPrice => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  String? get beforePrice => throw _privateConstructorUsedError;
  String? get saving => throw _privateConstructorUsedError;
  List<AddressModel>? get addresses => throw _privateConstructorUsedError;
  List<ImagesModel>? get images => throw _privateConstructorUsedError;
  bool? get isFavourite => throw _privateConstructorUsedError;
  List<Trips>? get offers => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularExperiencesCopyWith<PopularExperiences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularExperiencesCopyWith<$Res> {
  factory $PopularExperiencesCopyWith(
          PopularExperiences value, $Res Function(PopularExperiences) then) =
      _$PopularExperiencesCopyWithImpl<$Res, PopularExperiences>;
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      String? description,
      @JsonKey(name: "oldPrice") int? adultPrice,
      int? childPrice,
      String? imagePath,
      String? beforePrice,
      String? saving,
      List<AddressModel>? addresses,
      List<ImagesModel>? images,
      bool? isFavourite,
      List<Trips>? offers,
      List<Review>? reviews});
}

/// @nodoc
class _$PopularExperiencesCopyWithImpl<$Res, $Val extends PopularExperiences>
    implements $PopularExperiencesCopyWith<$Res> {
  _$PopularExperiencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? description = freezed,
    Object? adultPrice = freezed,
    Object? childPrice = freezed,
    Object? imagePath = freezed,
    Object? beforePrice = freezed,
    Object? saving = freezed,
    Object? addresses = freezed,
    Object? images = freezed,
    Object? isFavourite = freezed,
    Object? offers = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      beforePrice: freezed == beforePrice
          ? _value.beforePrice
          : beforePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      saving: freezed == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      offers: freezed == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularExperiencesImplCopyWith<$Res>
    implements $PopularExperiencesCopyWith<$Res> {
  factory _$$PopularExperiencesImplCopyWith(_$PopularExperiencesImpl value,
          $Res Function(_$PopularExperiencesImpl) then) =
      __$$PopularExperiencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      String? description,
      @JsonKey(name: "oldPrice") int? adultPrice,
      int? childPrice,
      String? imagePath,
      String? beforePrice,
      String? saving,
      List<AddressModel>? addresses,
      List<ImagesModel>? images,
      bool? isFavourite,
      List<Trips>? offers,
      List<Review>? reviews});
}

/// @nodoc
class __$$PopularExperiencesImplCopyWithImpl<$Res>
    extends _$PopularExperiencesCopyWithImpl<$Res, _$PopularExperiencesImpl>
    implements _$$PopularExperiencesImplCopyWith<$Res> {
  __$$PopularExperiencesImplCopyWithImpl(_$PopularExperiencesImpl _value,
      $Res Function(_$PopularExperiencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? description = freezed,
    Object? adultPrice = freezed,
    Object? childPrice = freezed,
    Object? imagePath = freezed,
    Object? beforePrice = freezed,
    Object? saving = freezed,
    Object? addresses = freezed,
    Object? images = freezed,
    Object? isFavourite = freezed,
    Object? offers = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$PopularExperiencesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      beforePrice: freezed == beforePrice
          ? _value.beforePrice
          : beforePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      saving: freezed == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as String?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImagesModel>?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      offers: freezed == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularExperiencesImpl implements _PopularExperiences {
  const _$PopularExperiencesImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.description,
      @JsonKey(name: "oldPrice") required this.adultPrice,
      required this.childPrice,
      required this.imagePath,
      required this.beforePrice,
      required this.saving,
      required final List<AddressModel>? addresses,
      required final List<ImagesModel>? images,
      required this.isFavourite,
      required final List<Trips>? offers,
      required final List<Review>? reviews})
      : _addresses = addresses,
        _images = images,
        _offers = offers,
        _reviews = reviews;

  factory _$PopularExperiencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularExperiencesImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? description;
  @override
  @JsonKey(name: "oldPrice")
  final int? adultPrice;
  @override
  final int? childPrice;
  @override
  final String? imagePath;
  @override
  final String? beforePrice;
  @override
  final String? saving;
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
  final bool? isFavourite;
  final List<Trips>? _offers;
  @override
  List<Trips>? get offers {
    final value = _offers;
    if (value == null) return null;
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _reviews;
  @override
  List<Review>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PopularExperiences(id: $id, name: $name, address: $address, description: $description, adultPrice: $adultPrice, childPrice: $childPrice, imagePath: $imagePath, beforePrice: $beforePrice, saving: $saving, addresses: $addresses, images: $images, isFavourite: $isFavourite, offers: $offers, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularExperiencesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.adultPrice, adultPrice) ||
                other.adultPrice == adultPrice) &&
            (identical(other.childPrice, childPrice) ||
                other.childPrice == childPrice) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.beforePrice, beforePrice) ||
                other.beforePrice == beforePrice) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
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
      imagePath,
      beforePrice,
      saving,
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_images),
      isFavourite,
      const DeepCollectionEquality().hash(_offers),
      const DeepCollectionEquality().hash(_reviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularExperiencesImplCopyWith<_$PopularExperiencesImpl> get copyWith =>
      __$$PopularExperiencesImplCopyWithImpl<_$PopularExperiencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularExperiencesImplToJson(
      this,
    );
  }
}

abstract class _PopularExperiences implements PopularExperiences {
  const factory _PopularExperiences(
      {required final int id,
      required final String name,
      required final String address,
      required final String? description,
      @JsonKey(name: "oldPrice") required final int? adultPrice,
      required final int? childPrice,
      required final String? imagePath,
      required final String? beforePrice,
      required final String? saving,
      required final List<AddressModel>? addresses,
      required final List<ImagesModel>? images,
      required final bool? isFavourite,
      required final List<Trips>? offers,
      required final List<Review>? reviews}) = _$PopularExperiencesImpl;

  factory _PopularExperiences.fromJson(Map<String, dynamic> json) =
      _$PopularExperiencesImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get description;
  @override
  @JsonKey(name: "oldPrice")
  int? get adultPrice;
  @override
  int? get childPrice;
  @override
  String? get imagePath;
  @override
  String? get beforePrice;
  @override
  String? get saving;
  @override
  List<AddressModel>? get addresses;
  @override
  List<ImagesModel>? get images;
  @override
  bool? get isFavourite;
  @override
  List<Trips>? get offers;
  @override
  List<Review>? get reviews;
  @override
  @JsonKey(ignore: true)
  _$$PopularExperiencesImplCopyWith<_$PopularExperiencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
