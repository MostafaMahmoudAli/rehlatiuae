// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticatedClient _$AuthenticatedClientFromJson(Map<String, dynamic> json) {
  return _AuthenticatedClient.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatedClient {
  Client get client => throw _privateConstructorUsedError;

  @JsonKey(name: "expires_in")
  int get expiresIn => throw _privateConstructorUsedError;

  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticatedClientCopyWith<AuthenticatedClient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatedClientCopyWith<$Res> {
  factory $AuthenticatedClientCopyWith(AuthenticatedClient value, $Res Function(AuthenticatedClient) then) =
      _$AuthenticatedClientCopyWithImpl<$Res, AuthenticatedClient>;

  @useResult
  $Res call(
      {Client client, @JsonKey(name: "expires_in") int expiresIn, @JsonKey(name: "access_token") String accessToken});

  $ClientCopyWith<$Res> get client;
}

/// @nodoc
class _$AuthenticatedClientCopyWithImpl<$Res, $Val extends AuthenticatedClient>
    implements $AuthenticatedClientCopyWith<$Res> {
  _$AuthenticatedClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? expiresIn = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res> get client {
    return $ClientCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthenticatedClientImplCopyWith<$Res> implements $AuthenticatedClientCopyWith<$Res> {
  factory _$$AuthenticatedClientImplCopyWith(
          _$AuthenticatedClientImpl value, $Res Function(_$AuthenticatedClientImpl) then) =
      __$$AuthenticatedClientImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {Client client, @JsonKey(name: "expires_in") int expiresIn, @JsonKey(name: "access_token") String accessToken});

  @override
  $ClientCopyWith<$Res> get client;
}

/// @nodoc
class __$$AuthenticatedClientImplCopyWithImpl<$Res>
    extends _$AuthenticatedClientCopyWithImpl<$Res, _$AuthenticatedClientImpl>
    implements _$$AuthenticatedClientImplCopyWith<$Res> {
  __$$AuthenticatedClientImplCopyWithImpl(
      _$AuthenticatedClientImpl _value, $Res Function(_$AuthenticatedClientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? expiresIn = null,
    Object? accessToken = null,
  }) {
    return _then(_$AuthenticatedClientImpl(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticatedClientImpl implements _AuthenticatedClient {
  const _$AuthenticatedClientImpl(
      {required this.client,
      @JsonKey(name: "expires_in") required this.expiresIn,
      @JsonKey(name: "access_token") required this.accessToken});

  factory _$AuthenticatedClientImpl.fromJson(Map<String, dynamic> json) => _$$AuthenticatedClientImplFromJson(json);

  @override
  final Client client;
  @override
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @override
  @JsonKey(name: "access_token")
  final String accessToken;

  @override
  String toString() {
    return 'AuthenticatedClient(client: $client, expiresIn: $expiresIn, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedClientImpl &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn) &&
            (identical(other.accessToken, accessToken) || other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, client, expiresIn, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedClientImplCopyWith<_$AuthenticatedClientImpl> get copyWith =>
      __$$AuthenticatedClientImplCopyWithImpl<_$AuthenticatedClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticatedClientImplToJson(
      this,
    );
  }
}

abstract class _AuthenticatedClient implements AuthenticatedClient {
  const factory _AuthenticatedClient(
      {required final Client client,
      @JsonKey(name: "expires_in") required final int expiresIn,
      @JsonKey(name: "access_token") required final String accessToken}) = _$AuthenticatedClientImpl;

  factory _AuthenticatedClient.fromJson(Map<String, dynamic> json) = _$AuthenticatedClientImpl.fromJson;

  @override
  Client get client;

  @override
  @JsonKey(name: "expires_in")
  int get expiresIn;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;

  @override
  @JsonKey(ignore: true)
  _$$AuthenticatedClientImplCopyWith<_$AuthenticatedClientImpl> get copyWith => throw _privateConstructorUsedError;
}
