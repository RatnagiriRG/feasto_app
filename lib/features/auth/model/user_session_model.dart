// To parse this JSON data, do
//
//     final userSessionModel = userSessionModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_session_model.freezed.dart';
part 'user_session_model.g.dart';

UserSessionModel userSessionModelFromJson(String str) =>
    UserSessionModel.fromJson(json.decode(str));

String userSessionModelToJson(UserSessionModel data) =>
    json.encode(data.toJson());

@freezed
class UserSessionModel with _$UserSessionModel {
  const factory UserSessionModel({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") UserSessionData? data,
  }) = _UserSessionModel;

  factory UserSessionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSessionModelFromJson(json);
}

@freezed
class UserSessionData with _$UserSessionData {
  const factory UserSessionData({
    @JsonKey(name: "userId") String? userId,
    @JsonKey(name: "accessToken") String? accessToken,
    @JsonKey(name: "refreshToken") String? refreshToken,
  }) = _UserSessionData;

  factory UserSessionData.fromJson(Map<String, dynamic> json) =>
      _$UserSessionDataFromJson(json);
}
