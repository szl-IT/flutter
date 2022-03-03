import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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

  final _scrollerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const ClassicHeader(),
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        onRefresh: () => _onRefreshComplete(),
        onLoading: () => _onLoadMore(),
        child: NestedScrollView(
          controller: _scrollerController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _sliverAppBar(innerBoxIsScrolled),
              _sliverList(),
              SliverFixedExtentList(
                  delegate: _sliverChildListDelegate(), itemExtent: 50)
            ];
          },
          body: ListView.builder(
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
      ),
    );
  }

  SliverAppBar _sliverAppBar(bool fixTop) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      elevation: 0,
      title: const Text('嵌套ListView'),
      pinned: true,
      floating: true,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("sonzhling"),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Image.network(
          'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
      // 固定在顶部
      forceElevated: fixTop,
      bottom: PreferredSize(
          child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.amber,
              height: 100,
              child: const Center(
                child: Text("data"),
              )),
          preferredSize: const Size(double.infinity, 100)),
    );
  }

  SliverList _sliverList() {
    return SliverList(delegate: _sliverChildListDelegate());
  }

  SliverChildListDelegate _sliverChildListDelegate() {
    return SliverChildListDelegate([
      Container(
        height: 80,
        color: Colors.primaries[0],
      ),
      Container(
        height: 80,
        color: Colors.primaries[1],
      ),
      Container(
        height: 80,
        color: Colors.primaries[2],
      ),
    ]);
  }
}
