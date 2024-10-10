import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:feasto/configs/app_urls.dart';
import 'package:feasto/data/network/app_execption.dart';
import 'package:feasto/data/network/base_network_api_services.dart';
import 'package:feasto/features/auth/model/user_session_model.dart';
import 'package:feasto/features/auth/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BaseNetWorkApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<UserSessionData?> signIn(
      {required String email, required String password}) async {
    try {
      final Map<String, dynamic> data = {"email": email, "password": password};
      final response = await _apiService.post(AppUrls.login, data: data);
      final result = UserSessionModel.fromJson(response);
      return result.data;
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      final exception = e.response?.data["error"];
      exception != null
          ? throw e.response?.data["error"]
          : throw error.errorMessage;
    }
  }

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    try {
      final Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "username": name,
        "phone": phone
      };

      final response = await _apiService.post(AppUrls.create, data: data);
      if (response["msg"] == "successfully register") {
        return true;
      }

      return false;
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      final exception = e.response?.data["error"];
      exception != null
          ? throw e.response?.data["error"]
          : throw error.errorMessage;
    }
  }
}
