// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:dio/dio.dart';
import 'package:weather_app/constants/secondApi.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getWeather({
    required path,
    Map<String, dynamic>? queryParameters,
    String city = 'cairo',
  }) async {
    print('getweathear function done1');
    return await dio!.get(
      path,
      queryParameters: {
        'key': '$weatherApiKey',
        'q': '$city',
        'days': '$days',
      },
    );
  }
}
