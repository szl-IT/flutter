import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/customview/view/my_view.dart';

class CustomViewPage extends StatefulWidget {
  const CustomViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyViewState();
  }
}

///左右抖动动画
class MyViewState extends State<CustomViewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  late int count = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    animation = Tween(begin: -10.0, end: 10.0).animate(_animationController);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("自定义View"),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return Transform(
                  transform: Matrix4.rotationZ(animation.value * pi / 180),
                  alignment: Alignment.center,
                  child: Center(
                      child: CustomPaint(
                    painter: MyView(),
                  )),
                );
              });
        }));
  }
}
