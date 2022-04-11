import 'package:flustars/flustars.dart';
import 'package:flutter_study/remote/dio_manager/dio_manager.dart';
import 'package:flutter_study/ui/wan_android/bean/home_article_list_bena.dart';
import 'package:flutter_study/ui/wan_android/view_model/base_vm.dart';

class HomeVm extends BaseViewModel {


  void getHomeArticleList(int page) {
    DioManager.get("/article/list/$page/json", (data) {
      LogUtil.e(" success=${data.toString()}", tag: "szl");
      LogUtil.e(" success=${HomeArticleListBean.fromJson(data).datas}",
          tag: "szl");
    }, (exception) {
      LogUtil.e(" exception=${exception.toString()}", tag: "szl");
    });
  }
}
