import 'package:flutter_study/remote/dio_manager/base_reponse.dart';

class ApiException implements Exception {
  int errorCode;
  String errorMsg;

  ApiException(this.errorCode, this.errorMsg);

  static ApiException handlerException(BaseResponse baseResponse) {
    if (baseResponse.errorCode != 200 || baseResponse.errorCode != 0) {
      return ApiException(baseResponse.errorCode, baseResponse.errorMsg);
    }
    return null;
  }
}
