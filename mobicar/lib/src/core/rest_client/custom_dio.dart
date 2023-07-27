import 'package:dio/dio.dart';

import '../env/env.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.instance.get('backend_base_url'),
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Dio get dio => _dio;
}
