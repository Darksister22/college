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
  Dio dio = Dio(_baseOptions);
}
