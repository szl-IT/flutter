import 'package:dio/dio.dart';
import 'package:flutter_study/remote/network/base_exception.dart';

///cookie 拦截器 添加cookie
class DioTokenInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyaXNrVXNlcklkIjoiOTAiLCJsb2dpblR5cGUiOiIxIiwibmFtZSI6InN6bCIsImV4cCI6MTY0NjMzODkxOX0.MqJdJEpkmD_Nw0nWM19IUpYlZKOgEyBvu_RnrbJjt18";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}

///异常拦截器
class DioExceptionInterceptors extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case 200:
        handler.next(response);
        break;
      case 400:
        throw BadRequestException(400);
      case 401:
        throw UnauthorisedException(401);
      case 403:
        throw UnauthorisedException(403);
      case 404:
        throw UnauthorisedException(404);
      case 500:
      default:
        throw FetchDataException(
            response.statusCode,
            'Error occured while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    throw err;
  }
}
