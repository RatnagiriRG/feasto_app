import 'dart:async';
import 'package:dio/dio.dart';
import 'package:feasto/data/local/session_controller.dart';

class DioInterceptor extends Interceptor {
  final Dio _dio;
  final SessionController _sessionController = SessionController();
  Completer<bool>? _refreshCompleter;

  DioInterceptor(this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _sessionController.getAccessToken();

    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final isTokenRefreshed = await _refreshAccessToken();

      if (isTokenRefreshed) {
        final retryRequest = await _retryRequest(err.requestOptions);
        return handler.resolve(retryRequest);
      }
    }

    return handler.next(err);
  }

  Future<bool> _refreshAccessToken() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer();
    try {
      final refreshToken = await _sessionController.getRefreshToken();

      if (refreshToken == null) {
        _refreshCompleter!.complete(false);
        return false;
      }

      final response = await _dio.post('/client-refresh-token', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await _sessionController.saveSession({
          'token': newAccessToken,
          'refreshToken': newRefreshToken,
        });

        _refreshCompleter!.complete(true);
        return true;
      }

      _refreshCompleter!.complete(false);
      return false;
    } catch (e) {
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final newAccessToken = await _sessionController.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newAccessToken',
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
