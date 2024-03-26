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
  List<Trips>? get trips => throw _privateConstructorUsedError;

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
      List<Trips>? trips});
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
    Object? trips = freezed,
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
      trips: freezed == trips
          ? _value.trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
    ) as $Val);
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
      List<Trips>? trips});
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
    Object? trips = freezed,
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
      trips: freezed == trips
          ? _value._trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trips>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogsImpl implements _Blogs {
  const _$BlogsImpl(
      {this.id,
      this.name,
      this.description,
      this.imagePath,
      final List<Trips>? trips})
      : _trips = trips;

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
  final List<Trips>? _trips;
  @override
  List<Trips>? get trips {
    final value = _trips;
    if (value == null) return null;
    if (_trips is EqualUnmodifiableListView) return _trips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Blogs(id: $id, name: $name, description: $description, imagePath: $imagePath, trips: $trips)';
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
            const DeepCollectionEquality().equals(other._trips, _trips));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imagePath,
      const DeepCollectionEquality().hash(_trips));

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
      {final int? id,
      final String? name,
      final String? description,
      final String? imagePath,
      final List<Trips>? trips}) = _$BlogsImpl;

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
  List<Trips>? get trips;
  @override
  @JsonKey(ignore: true)
  _$$BlogsImplCopyWith<_$BlogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
