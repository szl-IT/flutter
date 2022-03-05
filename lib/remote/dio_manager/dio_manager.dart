import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_study/remote/dio_manager/dio_interceptors.dart';
import 'package:flutter_study/remote/network/base_api_service.dart';

enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class DioManager {
  factory DioManager() => _getInstance();

  static DioManager get instance => _getInstance();
  static DioManager _instance;

// 连接超时时间
  static const int connectTimeout = 60 * 1000;

// 响应超时时间
  static const int receiveTimeout = 60 * 1000;
  Dio _dio;

  DioManager._init() {
    if (_dio == null) {
      var options = BaseOptions(
          baseUrl: BaseApiService().baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout);
      _dio = Dio(options);
      _dio.interceptors.add(DioTokenInterceptors());
      _dio.interceptors.add(DioExceptionInterceptors());
      _dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }

  static DioManager _getInstance() {
    _instance ??= DioManager._init();
    return _instance;
  }

  // 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic> params,
    data,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    options ??= Options(method: _methodValues[method]);
    if (_methodValues[method] == "post") {
      options.headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
    }
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
