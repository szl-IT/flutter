import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_study/remote/dio_manager/base_reponse.dart';
import 'package:flutter_study/remote/dio_manager/dio_interceptors.dart';
import 'package:flutter_study/remote/network/base_api_service.dart';
import 'package:flutter_study/remote/network/base_exception.dart';

///请求成功回调
typedef Success = void Function(dynamic data);

///请求失败回调
typedef Failed = void Function(ApiException exception);

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

  ///post 请求
  static post(String path, Success success, Failed failed,
      {dynamic data}) async {
    try {
      var response = await DioManager.instance._dio
          .post(BaseApiService().baseUrl + path, data: data);
      var baseResponse = BaseResponse.fromJson(response.data);
      ApiException.handlerServerException(baseResponse);
      success(json.decode(json.encode(baseResponse.data)));
    } catch (e) {
      if (e is ApiException) {
        failed(e);
      } else {
        failed(ApiException.handlerOtherException(e));
      }
    }
  }

  ///get 请求
  static get(String path, Success success, Failed failed,
      Map<String, dynamic> queryParameters) async {
    try {
      var response = await DioManager.instance._dio.get(
          BaseApiService().baseUrl + path,
          queryParameters: queryParameters);
      var baseResponse = BaseResponse.fromJson(response.data);
      ApiException.handlerServerException(baseResponse);
      success(json.decode(json.encode(baseResponse.data)));
    } catch (e) {
      if (e is ApiException) {
        failed(e);
      } else {
        failed(ApiException.handlerOtherException(e));
      }
    }
  }
}
