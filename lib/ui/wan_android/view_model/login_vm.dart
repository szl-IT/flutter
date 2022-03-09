import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_study/remote/dio_manager/dio_manager.dart';
import 'package:flutter_study/remote/network/api_end_points.dart';
import 'package:flutter_study/ui/wan_android/bean/user_bean.dart';
import 'package:flutter_study/ui/wan_android/view_model/base_vm.dart';

class LoginViewModel extends BaseViewModel {
  var userData = UserData();

  void setUserData(UserData userData) {
    this.userData = userData;
    notifyListeners();
  }

  void login(String userName, String password) {
    LogUtil.e("username===$userName   pssword===$password", tag: "szl");
    updateLoadState(LoadState.loading);
    DioManager.post(ApiEndPoints.login, (data) {
      updateLoadState(LoadState.success);
      userData = UserData.fromJson(data);
    }, (exception) {
      updateLoadState(LoadState.failed);
    }, data: FormData.fromMap({"username": userName, "password": password}));
  }
}
