import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_study/animition/animation_demo.dart';
import 'package:flutter_study/animition/animation_hero.dart';
import 'package:flutter_study/animition/animation_stagger.dart';
import 'package:flutter_study/customview/customview_demo.dart';
import 'package:flutter_study/ui/easy_refresh_view_demo.dart';
import 'package:flutter_study/ui/sigle_child_scroller.dart';
import 'package:flutter_study/ui/wan_android/sp_const.dart';
import 'package:flutter_study/ui/wan_android/ui/home.dart';
import 'package:flutter_study/ui/wan_android/ui/login.dart';
import 'package:flutter_study/ui/widget_list.dart';
import 'package:flutter_study/ui/xqax_home_page_demo.dart';
import 'package:flutter_study/widget/loading_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

///easy_loading 初始化
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/animation': (context) => const AnimationPage(),
        '/hero': (context) => const HeroAnimationPage(),
        '/hero/detail': (context) => const HeroDetailPage(),
        '/stagger': (context) => const StaggerAnimationPage(),
        '/custom': (context) => const CustomViewPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

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
        title: Text(widget.title ?? ""),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  child: child,
                  scale: animation,
                );
              },
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
                key: ValueKey<int>(_counter),
              ),
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
                      LogUtil.e(
                          "sputil===${SpUtil.getString(SPConst.cookie, defValue: "")}",
                          tag: "szl"),
                      if (SpUtil.getString(SPConst.cookie)?.isNotEmpty == true)
                        {Navigator.pushNamed(context, '/home')}
                      else
                        {Navigator.pushNamed(context, "/login")}
                    },
                child: const Text("Dio 登录请求")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoadingPage()))
                    },
                child: const Text("注册")),
            ElevatedButton(
                onPressed: () => {Navigator.pushNamed(context, "/stagger")},
                child: const Text("动画")),
            ElevatedButton(
                onPressed: () => {Navigator.pushNamed(context, "/custom")},
                child: const Text("自定义动画")),
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
