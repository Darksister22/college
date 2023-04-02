import 'package:dio/dio.dart';

class Api {
  static const _baseUri = 'http://localhost:8001/api/';
  static final BaseOptions _baseOptions = BaseOptions(
    validateStatus: (_) => true,
    baseUrl: _baseUri,
    headers: {
      'Accept': 'application/json',
      "Content-Type": "application/json",
    },
  );

  static final Api _instance = Api._internal();
  factory Api() => _instance;
  Api._internal() {
    _dio = Dio(_baseOptions);
  }

  late Dio _dio;

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Dio get dio => _dio;
}
