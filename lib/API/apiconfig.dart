import 'package:dio/dio.dart';

class Api {
  static const _baseUri = 'https://api.github.com/users/mralexgray/';
  static final BaseOptions _baseOptions = BaseOptions(
      validateStatus: (_) => true,
      baseUrl: _baseUri,
      headers: {"Content-Type": "application/json"});
  Dio dio = Dio(_baseOptions);
}
