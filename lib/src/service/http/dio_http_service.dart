import 'package:dio/dio.dart';
import 'package:weather_app/app_consts.dart';

import 'http_service.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService(
      // this.storageService,
      {
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    // if (enableCaching) {
    //   dio.interceptors.add(CacheInterceptor(storageService));
    // }
  }

  /// Storage service used for caching http responses
  // final StorageService storageService;

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => BASE_URL;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    // dio.options.extra[Configs.dioCacheForceRefreshKey] = forceRefresh;

    final Response<dynamic> response = await dio.get<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data == null || response.statusCode != 200) {
      // throw HttpException(
      //   title: 'Http Error!',
      //   statusCode: response.statusCode,
      //   message: response.statusMessage,
      // );
      throw Exception('Throwing Error');
    }

    return response.data as Map<String, dynamic>;
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response<dynamic> response = await dio.post<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      // throw HttpException(
      //   title: 'Http Error!',
      //   statusCode: response.statusCode,
      //   message: response.statusMessage,
      // );
      throw Exception('Throwing Error');
    }

    return response.data;
  }
}
