import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/customview/view/my_view.dart';

class CustomViewPage extends StatelessWidget {
  const CustomViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义View"),
      ),
      body: CustomPaint(
        painter: MyView(),
      ),
    );
  }
}
