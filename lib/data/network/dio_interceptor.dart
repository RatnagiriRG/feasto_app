import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:feasto/configs/app_urls.dart';
import 'package:feasto/data/local/session_controller.dart';

class DioInterceptor extends Interceptor {
  final Dio _dio;

  DioInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
      "Accept": "*/*",
    });

    // if the user is loged in
    final userSession = SessionController().user;
    if (userSession.accessToken != null &&
        options.path != AppUrls.refreshToken) {
      options.headers.addAll({
        "Authorization": "Bearer ${userSession.accessToken}",
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != AppUrls.refreshToken &&
        err.requestOptions.path != AppUrls.login) {
      if (err.requestOptions.path == AppUrls.logout) {
        return;
      }
      if (await _refreshAccessToken()) {
        try {
          handler.resolve(await _retryRequest(err.requestOptions));
        } on DioException catch (e) {
          handler.next(e);
        }
      }

      return;
    }

    handler.reject(err);
  }

  Future<bool> _refreshAccessToken() async {
    final userSession = SessionController().user;
    Map<String, dynamic> data = {"refreshToken": userSession.refreshToken};
    const path = AppUrls.refreshToken;
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final accessToken = response.data["data"]["accessToken"];
        final refreshToken = response.data["data"]["refreshToken"];
        final newUserSession = userSession.copyWith(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        await SessionController().saveUserSession(newUserSession);
        if (accessToken != null && refreshToken != null) {
          return true;
        }
      }

      return false;
    } on DioException catch (e) {
      log("$e  REFRESH TOKKEN EXCEPTION FROM INTERCEPTOR");
      // _handleRefreshTokenException(e);
      return false;
    }
  }

  //   Future<void> _handleRefreshTokenException(DioException e) async {
  //   await _logout();
  //   final currentContext = NavigationService.navigatorKey.currentContext;
  //   if (currentContext != null && currentContext.mounted) {
  //     final userProfileViewModel = currentContext.read<UserProfileViewModel>();
  //     await userProfileViewModel.clearAllSession(context: currentContext);
  //     if (!currentContext.mounted) return;
  //     Navigator.pushNamedAndRemoveUntil(
  //       currentContext,
  //       RoutesName.onboardingScreen,
  //       (route) => false,
  //     );
  //   }
  // }

  // Future<void> _logout() async {
  //   final userSession = SessionController().user;
  //   final headers = {"Authorization": "Bearer ${userSession.accessToken}"};
  //   Dio dioInstance =
  //       Dio(BaseOptions(baseUrl: AppUrl.baseURL, headers: headers));
  //   try {
  //     final data = {
  //       "refreshToken": userSession.refreshToken,
  //       "userId": userSession.userId,
  //     };
  //     await dioInstance.post(AppUrl.logOutUser, data: data);
  //   } on DioException catch (e) {
  //     var error = DioExceptions.fromDioException(e);
  //     error.errorMessage;
  //   }
  // }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final userSession = SessionController().user;
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer ${userSession.accessToken}',
      },
    );
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
