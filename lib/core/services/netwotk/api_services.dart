import 'package:dio/dio.dart';

class ApiServices {
  final String baseUrl = 'https://dummyjson.com/';
  final Dio dio;
  ApiServices({required this.dio});
  Future<dynamic> get({required String endpoint}) async {
    final response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
