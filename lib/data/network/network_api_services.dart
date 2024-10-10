import 'package:dio/dio.dart';

import 'package:feasto/data/network/dio_client.dart';

class NetworkApiService {
  final _dio = DioClient.instance.dio;

  Future<Map<String, dynamic>> post(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await _dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}
