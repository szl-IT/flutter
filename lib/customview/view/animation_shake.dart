import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///抖动动画
class ShakeAnimationPage extends StatefulWidget {
  const ShakeAnimationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShakeAnimationState();
  }
}

class ShakeAnimationState extends State<ShakeAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late int count = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    animation = Tween(begin: -10.0, end: 10.0).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        count++;
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.reset();
        if (count <= 3) {
          _animationController.forward();
        }
      }
    });
    _animationController.forward();
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
                return Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: Center(
                    child: Container(
                      color: Colors.blueAccent,
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        "抖动动画",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
