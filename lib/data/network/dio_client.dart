import 'package:dio/dio.dart';
import 'package:feasto/configs/app_urls.dart';
import 'package:feasto/data/network/dio_interceptor.dart';

class DioClient {
  DioClient._() {
    dio.interceptors.add(DioInterceptor(dio));
  }

  static final instance = DioClient._();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseURL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
      },
    ),
  );
}
