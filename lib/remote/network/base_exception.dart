import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_study/remote/dio_manager/base_reponse.dart';

///异常类 统一处理异常 [handlerOtherException]
class ApiException implements Exception {
  int errorCode;
  String errorMsg;

  ApiException(this.errorCode, this.errorMsg);

  ///处理服务器返回失败的异常
  ///处理其他的异常[handlerOtherException]
  static handlerServerException(BaseResponse? baseResponse) {
    if (baseResponse?.errorCode != 0 && baseResponse?.errorCode != 200) {
      throw ApiException(
          baseResponse?.errorCode ?? -1, baseResponse?.errorMsg ?? "失败");
    }
  }

  ///根据不同的错误类型定义不同的code 和msg 目前暂未对类型做出处理
  static handlerOtherException(Exception exception) {
    if (exception is ApiException) {
      return ApiException(exception.errorCode, exception.errorMsg);
    } else if (exception is SocketException) {
      return ApiException(-1, "网络连接失败");
    } else if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.connectTimeout:
          return ApiException(-1, "请求超时");
        case DioErrorType.sendTimeout:
          return ApiException(-1, "发送数据超时");
        case DioErrorType.receiveTimeout:
          return ApiException(-1, "接收数据超时");
        case DioErrorType.response:
          return ApiException(-1, "失败");
        case DioErrorType.cancel:
          return ApiException(-1, "取消请求");
        case DioErrorType.other:
          return ApiException(-1, "失败");
      }
    }
    return ApiException(-1, "请求失败");
  }

  @override
  String toString() {
    return json.encode({"errorCode": errorCode, "errorMsg": errorMsg});
  }
}

class FetchDataException extends ApiException {
  FetchDataException(int? errorCode, String? errorMsg)
      : super(errorCode ?? -1, errorMsg ?? "失败");
}

class BadRequestException extends ApiException {
  BadRequestException(int errorCode) : super(errorCode, "Invalid Request: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(int errorCode)
      : super(errorCode, "Unauthorised Request: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException(int errorCode) : super(errorCode, "Invalid Input: ");
}

class NoInternetException extends ApiException {
  NoInternetException(int errorCode) : super(errorCode, "网络连接失败");
}
