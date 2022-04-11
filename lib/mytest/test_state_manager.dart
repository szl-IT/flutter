import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/mytest/jump_activity.dart';

class StateDemoPage extends StatefulWidget {
  const StateDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateState();
  }
}

class StateState extends State<StateDemoPage> {
  var isActive = false;
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  var _left = 20.0;

  void handlerActive() {
    setState(() {
      isActive = !isActive;
    });
  }

  Widget _createButtonContainer() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("按钮练习")),
          ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
          TextButton(onPressed: () {}, child: const Text("TextButton")),
          OutlinedButton(onPressed: () {}, child: const Text("outlineButton")),
          IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("发送")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("发送")),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("发送")),
        ],
      ),
    );
  }

  Widget _createImageContainer() {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Image 练习")),
            Image.asset(
              "images/img_head.png",
              width: 80,
              height: 80,
            ),
            Image.asset(
              "images/img_head.png",
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
              height: 100,
            )
          ],
        ));
  }

  Widget _createGesture() {
    return Container(
      color: Colors.amber,
      child: GestureDetector(
        child: Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: _left,
          height: 100,
        ),
        onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
          setState(() {
            _left = 100 * scaleUpdateDetails.scale.clamp(.8, 10);
          });
        },
      ),
    );
  }

  Widget _jumpToNativeActivity() {
    return ElevatedButton(
        onPressed: () async {
          String result;
          try {
            result =
                await JumpToActivity.pushFirstActivity({"name": "songzhilin"});
          } on PlatformException {
            result = '失败';
          }
          print(result);
        },
        child: const Text("跳转到原生界面"));
  }

  Widget _jumpToSplashActivity() {
    return ElevatedButton(
        onPressed: () async {
          String result;
          try {
            result =
                await JumpToActivity.pushSplashActivity({"name": "songzhilin"});
          } on PlatformException {
            result = '失败';
          }
          print(result);
        },
        child: const Text("jumpToSplash"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("练习"),
      ),
      floatingActionButton: const CircleAvatar(
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            const SizedBox(), //中间位置空出
            const Tab(
              text: "分类",
              iconMargin: EdgeInsets.all(2),
              icon: Icon(Icons.business),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: handlerActive,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: isActive ? Colors.amber : Colors.blue,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text.rich(TextSpan(children: [
                    const TextSpan(text: "home"),
                    TextSpan(
                        text: "www.baidu.com",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: _tapGestureRecognizer
                          ..onTap = () {
                            setState(() {});
                          })
                  ])),
                  const Text(
                    "songzhili",
                    textAlign: TextAlign.center,
                  ),
                  _createButtonContainer(),
                  _createImageContainer(),
                  _createGesture(),
                  _jumpToNativeActivity(),
                  _jumpToSplashActivity()
                ],
              ),
            )),
      ),
    );
  }
}
