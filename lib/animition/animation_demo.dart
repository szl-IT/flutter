import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///动画练习
class AnimationPage extends StatefulWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);

    animation = Tween(begin: 0.0, end: 300.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
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
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, child) {
            return Image.asset(
              "images/img_home__car_bg.png",
              width: animation.value,
              height: animation.value,
            );
          },
        ),
      ),
    );
  }
}
