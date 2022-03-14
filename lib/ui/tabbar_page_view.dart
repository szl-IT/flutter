import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///tabBar+pageView
class TabBarPageViewPage extends StatelessWidget {
  const TabBarPageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarPageViewController();
  }
}

class TabBarPageViewController extends StatefulWidget {
  const TabBarPageViewController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TabBarPageViewState();
  }
}

class TabBarPageViewState extends State<TabBarPageViewController>
    with TickerProviderStateMixin {
  final tabs = ['关注', '推荐', '抗疫', '热榜', '精品课', '旅游']
      .map((e) =>
      Tab(
        text: e,
      ))
      .toList();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  void _selectPageView(int index) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tabBar PageView"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
