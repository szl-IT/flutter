import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/easy_refresh_view_demo.dart';
import 'package:flutter_study/ui/widget_list.dart';
import 'package:flutter_study/ui/xqax_home_page_demo.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationController(),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigationController> {
  var _currentIndex = 0;

  final pages = [
    const EasyRefreshPage(),
    const XQAXHomePage(),
    const WidgetListPage()
  ];

  void selectIndexItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "聊天室"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '個人資料'),
        ],
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (int index) {
          selectIndexItem(index);
        },
      ),
    );
  }
}
