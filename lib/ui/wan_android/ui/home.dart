import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/wan_android/view_model/home_vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
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

  @override
  void initState() {
    super.initState();
    viewModel.getHomeArticleList(1);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
