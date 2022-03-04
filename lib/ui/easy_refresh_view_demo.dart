import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyRefreshPage extends StatefulWidget {
  const EasyRefreshPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EasyRefreshState();
  }
}

class EasyRefreshState extends State<EasyRefreshPage> {
  EasyRefreshController _easyRefreshController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
    _scrollController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Material(
        child: EasyRefresh.custom(
      firstRefresh: true,
      controller: _easyRefreshController,
      enableControlFinishRefresh: true,
      header: BezierCircleHeader(),
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        setState(() {
          _easyRefreshController.finishRefresh();
        });
      },
      onLoad: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        setState(() {
          _easyRefreshController.finishLoad();
        });
      },
      slivers: [_sliverAppBar(true), _sliverList()],
    ));
  }

  NestedScrollView _nestedScrollView() {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _sliverAppBar(innerBoxIsScrolled),
            _sliverList(),
          ];
        },
        body: _listView());
  }

  ListView _listView() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return ElevatedButton(
          onPressed: () => {},
          child: Text(titleList[index]),
        );
      },
      itemCount: titleList.length,
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
      Container(
        height: 80,
        color: Colors.primaries[3],
      ),
      Container(
        height: 80,
        color: Colors.primaries[4],
      ),
      Container(
        height: 80,
        color: Colors.primaries[5],
      ),
      Container(
        height: 80,
        color: Colors.primaries[6],
      ),
      Container(
        height: 80,
        color: Colors.primaries[7],
      ),
      Container(
        height: 80,
        color: Colors.primaries[8],
      ),
      Container(
        height: 80,
        color: Colors.primaries[9],
      ),
      Container(
        height: 80,
        color: Colors.primaries[10],
      ),
    ]);
  }
}
