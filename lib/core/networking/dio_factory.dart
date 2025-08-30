import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:football_commentary_app/core/env/environment_variables.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeout = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!.options = BaseOptions(
        baseUrl: EnvironmentVariables.footballApiBaseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      );

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': EnvironmentVariables.footballApiKey,
      'X-RapidAPI-Host': 'v3.football.api-sports.io',
    };
  }

  static void addDioInterceptor() {
    // Only add logging in debug mode
    if (kDebugMode) {
      dio?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }
}

