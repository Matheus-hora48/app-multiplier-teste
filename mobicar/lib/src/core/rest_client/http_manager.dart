import 'package:dio/dio.dart';

import '../env/env.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  Future<dynamic> restRequest({
    required String url,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>();

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );

      return response.data;
    } catch (e) {
      return {};
    }
  }
}
