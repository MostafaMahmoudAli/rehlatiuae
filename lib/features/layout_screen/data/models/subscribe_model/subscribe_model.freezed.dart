// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscribeModel _$SubscribeModelFromJson(Map<String, dynamic> json) {
  return _SubscribeModel.fromJson(json);
}

/// @nodoc
mixin _$SubscribeModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscribeModelCopyWith<SubscribeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeModelCopyWith<$Res> {
  factory $SubscribeModelCopyWith(
          SubscribeModel value, $Res Function(SubscribeModel) then) =
      _$SubscribeModelCopyWithImpl<$Res, SubscribeModel>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$SubscribeModelCopyWithImpl<$Res, $Val extends SubscribeModel>
    implements $SubscribeModelCopyWith<$Res> {
  _$SubscribeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscribeModelImplCopyWith<$Res>
    implements $SubscribeModelCopyWith<$Res> {
  factory _$$SubscribeModelImplCopyWith(_$SubscribeModelImpl value,
          $Res Function(_$SubscribeModelImpl) then) =
      __$$SubscribeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$SubscribeModelImplCopyWithImpl<$Res>
    extends _$SubscribeModelCopyWithImpl<$Res, _$SubscribeModelImpl>
    implements _$$SubscribeModelImplCopyWith<$Res> {
  __$$SubscribeModelImplCopyWithImpl(
      _$SubscribeModelImpl _value, $Res Function(_$SubscribeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$SubscribeModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeModelImpl implements _SubscribeModel {
  const _$SubscribeModelImpl({required this.name, required this.email});

  factory _$SubscribeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeModelImplFromJson(json);

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'SubscribeModel(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeModelImplCopyWith<_$SubscribeModelImpl> get copyWith =>
      __$$SubscribeModelImplCopyWithImpl<_$SubscribeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeModelImplToJson(
      this,
    );
  }
}

abstract class _SubscribeModel implements SubscribeModel {
  const factory _SubscribeModel(
      {required final String name,
      required final String email}) = _$SubscribeModelImpl;

  factory _SubscribeModel.fromJson(Map<String, dynamic> json) =
      _$SubscribeModelImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SubscribeModelImplCopyWith<_$SubscribeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
