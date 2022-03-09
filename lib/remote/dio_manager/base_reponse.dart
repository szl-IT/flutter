import 'dart:convert';

class BaseResponse<T> {
  int errorCode;
  String errorMsg;
  T data;

  BaseResponse(this.errorCode, this.errorMsg, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      BaseResponse<T>(json["errorCode"], json["errorMsg"], json["data"]);

  Map<String, dynamic> toJson() =>
      {"errorCode": errorCode, "errorMsg": errorMsg, "data": data};

  @override
  String toString() {
    return json
        .encode({"errorCode": errorCode, "errorMsg": errorMsg, "T": data});
  }
}
