import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

//cookie 拦截器 添加cookie
class DioTokenInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyaXNrVXNlcklkIjoiOTAiLCJsb2dpblR5cGUiOiIxIiwibmFtZSI6InN6bCIsImV4cCI6MTY0NjMzODkxOX0.MqJdJEpkmD_Nw0nWM19IUpYlZKOgEyBvu_RnrbJjt18";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogUtil.e("reponse status==$response", tag: "szl");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}

class DioExceptionInterceptors extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.sendTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        break;
    }
    super.onError(err, handler);
  }
}
