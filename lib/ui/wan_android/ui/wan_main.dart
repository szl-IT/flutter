import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/wan_android/ui/home.dart';
import 'package:flutter_study/ui/wan_android/ui/official_accounts.dart';
import 'package:flutter_study/ui/wan_android/ui/project.dart';
import 'package:flutter_study/ui/wan_android/ui/square.dart';
import 'package:flutter_study/ui/wan_android/ui/tixi.dart';

class WanMainPage extends StatelessWidget {
  const WanMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: WanMainControllerPage(),
    );
  }
}

class WanMainControllerPage extends StatefulWidget {
  const WanMainControllerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WanMainControllerState();
  }
}

class WanMainControllerState extends State<WanMainControllerPage> {
  var bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    const BottomNavigationBarItem(icon: Icon(Icons.apartment), label: "广场"),
    const BottomNavigationBarItem(icon: Icon(Icons.comment), label: "公众号"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings_input_component), label: "体系"),
    const BottomNavigationBarItem(icon: Icon(Icons.view_compact), label: "项目"),
  ];

  final _pageViewItems = const [
    HomePage(),
    SquarePage(),
    TixiPage(),
    OfficialAccountsPage(),
    ProjectPage()
  ];

  late PageController _pageViewControl;

  var _currentIndex = 0;

  void _selectItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageViewControl = PageController();
  }

  @override
  void dispose() {
    _pageViewControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViewItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        fixedColor: Colors.red,
        onTap: (index) {
          _selectItem(index);
        },
      ),
    );
  }
}
