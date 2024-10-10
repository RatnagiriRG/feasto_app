// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionModelImpl _$$UserSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSessionModelImpl(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserSessionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSessionModelImplToJson(
        _$UserSessionModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$UserSessionDataImpl _$$UserSessionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSessionDataImpl(
      userId: json['userId'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$UserSessionDataImplToJson(
        _$UserSessionDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
