import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../local/local.dart';
import '../config/config.dart';
import 'dio_interceptor.dart';
import 'isolate_parser.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

@singleton
class DioClient {
  final PrefManager prefs;
  String baseUrl = const String.fromEnvironment("BASE_URL");

  String? _auth;
  final bool _isUnitTest = const bool.fromEnvironment("IS_UNIT_TEST");
  final bool _showLogs = const bool.fromEnvironment("LOGS");
  late Dio _dio;

  DioClient({required this.prefs}) {
    try {
      _auth = prefs.token;
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest && _showLogs) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      /// We need to recreate dio to avoid token issue after login
      try {
        _auth = prefs.token;
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest && _showLogs) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': 'Bearer $_auth',
            },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Either<ServerException, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerException.fromDioError(e));
    } catch (e) {
      return Left(ServerException.create(e));
    }
  }

  Future<Either<ServerException, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerException.fromDioError(e));
    } catch (e) {
      return Left(ServerException.create(e.toString()));
    }
  }
}
