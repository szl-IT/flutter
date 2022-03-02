import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshPage extends StatefulWidget {
  const PullToRefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PullToRefreshState();
  }
}

class PullToRefreshState extends State<PullToRefreshPage> {
  var titleList = [
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
    "ListView",
  ];

  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefreshComplete() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {});
      debugFillProperties(DiagnosticPropertiesBuilder());
      _refreshController.refreshCompleted();
    } catch (e) {}
  }

  void _onLoadMore() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
        titleList.add("songzhi");
      });
      _refreshController.loadComplete();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const ClassicHeader(),
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        onRefresh: () => _onRefreshComplete(),
        onLoading: () => _onLoadMore(),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () => {},
              child: Text(titleList[index]),
            );
          },
          itemCount: titleList.length,
        ),
      ),
    );
  }
}
