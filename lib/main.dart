
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/remote/dio_manager/dio_manager.dart';
import 'package:flutter_study/ui/easy_refresh_view_demo.dart';
import 'package:flutter_study/ui/sigle_child_scroller.dart';
import 'package:flutter_study/ui/widget_list.dart';
import 'package:flutter_study/ui/xqax_home_page_demo.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SingleChildScrollDemo()))
                    },
                child: const Text("跳转到singleChildScroll")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WidgetListPage()))
                    },
                child: const Text("跳转到list页面")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EasyRefreshPage()))
                    },
                child: const Text("easyRefresh")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const XQAXHomePage()))
                    },
                child: const Text("小仟安行Home")),
            ElevatedButton(
                onPressed: () => {
                      Fluttertoast.showToast(
                          msg: "zhssdf",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER)
                    },
                child: const Text("小仟安行H11ome")),
            ElevatedButton(
                onPressed: () => {
                      DioManager.instance
                          .request("/article/list/0/json",
                              method: DioMethod.get,
                              data: {
                                "username": "17630035658",
                                "password": "szl201314"
                              },
                              onReceiveProgress: (value1, value2) => {
                                    LogUtil.e(
                                        "onReceiveProgress value==$value1,$value2",
                                        tag: "szl")
                                  },
                              onSendProgress: (value1, value2) => {
                                    LogUtil.e(
                                        "onSendProgress value==$value1,$value2",
                                        tag: "szl")
                                  })
                          .then((value) => LogUtil.e(value, tag: "szl"))
                          .onError((error, stackTrace) =>
                              LogUtil.e("onError error==$error", tag: "szl"))
                          .whenComplete(() => LogUtil.e("complete", tag: "szl"))
                    },
                child: const Text("Dio 登录请求"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
