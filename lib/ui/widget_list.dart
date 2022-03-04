import 'package:flutter/material.dart';
import 'package:flutter_study/ui/nested_scroll_view.dart';
import 'package:flutter_study/ui/pull_to_refresh_demo.dart';

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WidgetListState();
  }
}

class WidgetListState extends State<WidgetListPage> {
  var titleList = ["ListView", "NestedScrollView"];

  void goPullToRefresh(int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PullToRefreshPage()));
          break;
        }
      case 1:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NestedScrollViewPage()));
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () => {goPullToRefresh(index)},
            child: Text(titleList[index]),
          );
        },
        itemCount: titleList.length,
      ),
    );
  }
}
