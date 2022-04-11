import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_study/ui/wan_android/view_model/home_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light),
      ),
      body: const HomePageController(),
    );
  }
}

class HomePageController extends StatefulWidget {
  const HomePageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageControllerState();
  }
}

class HomePageControllerState extends State<HomePageController> {
  var viewModel = HomeVm();
  EasyRefreshController? _easyRefreshController;

  @override
  void initState() {
    super.initState();
    viewModel.getHomeArticleList(1);
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    viewModel.dispose();
    _easyRefreshController?.dispose();
    super.dispose();
  }

  void _refresh() async {
    _easyRefreshController?.callRefresh();
    await Future.delayed(const Duration(seconds: 5));
    _easyRefreshController?.finishRefresh();
  }

  void _load() async {
    _easyRefreshController?.callLoad();
    await Future.delayed(const Duration(seconds: 5));
    _easyRefreshController?.finishLoad();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      header: ClassicalHeader(),
      onLoad: () async {
        _load();
      },
      onRefresh: () async {
        _refresh();
      },
      controller: _easyRefreshController,
      slivers: [],
    );
  }
}
