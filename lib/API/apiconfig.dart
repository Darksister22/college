import 'package:dio/dio.dart';

class Api {
  static const _baseUri = 'http://localhost:8001/';
  static final BaseOptions _baseOptions = BaseOptions(
    validateStatus: (_) => true,
    baseUrl: _baseUri,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
  );
  Dio dio = Dio(_baseOptions);
}
