import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///交织动画  多个动画效果叠加混合使用
class StaggerAnimationPage extends StatefulWidget {
  const StaggerAnimationPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationState();
  }
}

class StaggerAnimationState extends State<StaggerAnimationPage>
    with SingleTickerProviderStateMixin {
  ///高度动画
  Animation<double> heightAnimation;

  /// 颜色动画
  Animation<Color> colorAnimation;

  Animation<EdgeInsets> paddingAnimation;
  Animation<EdgeInsets> paddingTopAnimation;

  ///动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    heightAnimation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.ease)));

    colorAnimation = ColorTween(begin: Colors.blueAccent, end: Colors.red)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.6, curve: Curves.ease)));

    paddingTopAnimation = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(top: .0),
      end: const EdgeInsets.only(top: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    paddingAnimation = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: .0, top: .0),
      end: const EdgeInsets.only(left: 100.0, top: 10.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

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
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, child) {
              return Container(
                margin: paddingAnimation.value,
                width: 50,
                color: colorAnimation.value,
                height: heightAnimation.value,
              );
            }));
  }
}
