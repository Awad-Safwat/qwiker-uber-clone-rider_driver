import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://maps.googleapis.com/maps/api/';

  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    // print('$baseUrl$endPoint');
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
