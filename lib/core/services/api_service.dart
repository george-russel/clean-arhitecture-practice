import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  /// GET request
  Future<Response> get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      final response =
          await _dio.get(url, options: Options(headers: queryParams));
      return response;
    } on DioException catch (e) {
      throw Exception('GET request failed: ${e.message}');
    }
  }

  /// POST request
  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParams,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('POST request failed: ${e.message}');
    }
  }
}
