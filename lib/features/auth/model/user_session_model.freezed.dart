// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSessionModel _$UserSessionModelFromJson(Map<String, dynamic> json) {
  return _UserSessionModel.fromJson(json);
}

/// @nodoc
mixin _$UserSessionModel {
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  UserSessionData? get data => throw _privateConstructorUsedError;

  /// Serializes this UserSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSessionModelCopyWith<UserSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSessionModelCopyWith<$Res> {
  factory $UserSessionModelCopyWith(
          UserSessionModel value, $Res Function(UserSessionModel) then) =
      _$UserSessionModelCopyWithImpl<$Res, UserSessionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "data") UserSessionData? data});

  $UserSessionDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserSessionModelCopyWithImpl<$Res, $Val extends UserSessionModel>
    implements $UserSessionModelCopyWith<$Res> {
  _$UserSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserSessionData?,
    ) as $Val);
  }

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserSessionDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSessionModelImplCopyWith<$Res>
    implements $UserSessionModelCopyWith<$Res> {
  factory _$$UserSessionModelImplCopyWith(_$UserSessionModelImpl value,
          $Res Function(_$UserSessionModelImpl) then) =
      __$$UserSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "data") UserSessionData? data});

  @override
  $UserSessionDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UserSessionModelImplCopyWithImpl<$Res>
    extends _$UserSessionModelCopyWithImpl<$Res, _$UserSessionModelImpl>
    implements _$$UserSessionModelImplCopyWith<$Res> {
  __$$UserSessionModelImplCopyWithImpl(_$UserSessionModelImpl _value,
      $Res Function(_$UserSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UserSessionModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserSessionData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSessionModelImpl implements _UserSessionModel {
  const _$UserSessionModelImpl(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$UserSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSessionModelImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final UserSessionData? data;

  @override
  String toString() {
    return 'UserSessionModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSessionModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSessionModelImplCopyWith<_$UserSessionModelImpl> get copyWith =>
      __$$UserSessionModelImplCopyWithImpl<_$UserSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSessionModelImplToJson(
      this,
    );
  }
}

abstract class _UserSessionModel implements UserSessionModel {
  const factory _UserSessionModel(
          {@JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final UserSessionData? data}) =
      _$UserSessionModelImpl;

  factory _UserSessionModel.fromJson(Map<String, dynamic> json) =
      _$UserSessionModelImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  UserSessionData? get data;

  /// Create a copy of UserSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSessionModelImplCopyWith<_$UserSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSessionData _$UserSessionDataFromJson(Map<String, dynamic> json) {
  return _UserSessionData.fromJson(json);
}

/// @nodoc
mixin _$UserSessionData {
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "accessToken")
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "refreshToken")
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this UserSessionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSessionDataCopyWith<UserSessionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSessionDataCopyWith<$Res> {
  factory $UserSessionDataCopyWith(
          UserSessionData value, $Res Function(UserSessionData) then) =
      _$UserSessionDataCopyWithImpl<$Res, UserSessionData>;
  @useResult
  $Res call(
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "accessToken") String? accessToken,
      @JsonKey(name: "refreshToken") String? refreshToken});
}

/// @nodoc
class _$UserSessionDataCopyWithImpl<$Res, $Val extends UserSessionData>
    implements $UserSessionDataCopyWith<$Res> {
  _$UserSessionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSessionDataImplCopyWith<$Res>
    implements $UserSessionDataCopyWith<$Res> {
  factory _$$UserSessionDataImplCopyWith(_$UserSessionDataImpl value,
          $Res Function(_$UserSessionDataImpl) then) =
      __$$UserSessionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "accessToken") String? accessToken,
      @JsonKey(name: "refreshToken") String? refreshToken});
}

/// @nodoc
class __$$UserSessionDataImplCopyWithImpl<$Res>
    extends _$UserSessionDataCopyWithImpl<$Res, _$UserSessionDataImpl>
    implements _$$UserSessionDataImplCopyWith<$Res> {
  __$$UserSessionDataImplCopyWithImpl(
      _$UserSessionDataImpl _value, $Res Function(_$UserSessionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSessionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$UserSessionDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSessionDataImpl implements _UserSessionData {
  const _$UserSessionDataImpl(
      {@JsonKey(name: "userId") this.userId,
      @JsonKey(name: "accessToken") this.accessToken,
      @JsonKey(name: "refreshToken") this.refreshToken});

  factory _$UserSessionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSessionDataImplFromJson(json);

  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "accessToken")
  final String? accessToken;
  @override
  @JsonKey(name: "refreshToken")
  final String? refreshToken;

  @override
  String toString() {
    return 'UserSessionData(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSessionDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, accessToken, refreshToken);

  /// Create a copy of UserSessionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSessionDataImplCopyWith<_$UserSessionDataImpl> get copyWith =>
      __$$UserSessionDataImplCopyWithImpl<_$UserSessionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSessionDataImplToJson(
      this,
    );
  }
}

abstract class _UserSessionData implements UserSessionData {
  const factory _UserSessionData(
          {@JsonKey(name: "userId") final String? userId,
          @JsonKey(name: "accessToken") final String? accessToken,
          @JsonKey(name: "refreshToken") final String? refreshToken}) =
      _$UserSessionDataImpl;

  factory _UserSessionData.fromJson(Map<String, dynamic> json) =
      _$UserSessionDataImpl.fromJson;

  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "accessToken")
  String? get accessToken;
  @override
  @JsonKey(name: "refreshToken")
  String? get refreshToken;

  /// Create a copy of UserSessionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSessionDataImplCopyWith<_$UserSessionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
