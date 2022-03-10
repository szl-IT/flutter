import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NestedScrollViewPage extends StatefulWidget {
  const NestedScrollViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NestedScrollViewState();
  }
}

class NestedScrollViewState extends State<NestedScrollViewPage> {
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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _sliverAppBar(innerBoxIsScrolled),
            _sliverList(),
            SliverFixedExtentList(
                delegate: _sliverChildListDelegate(), itemExtent: 50)
          ];
        },
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
      stretch: true,
      stretchTriggerOffset: 50,
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

  void _onRefreshComplete() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {});
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
}
