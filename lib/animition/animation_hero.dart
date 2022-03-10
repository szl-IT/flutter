import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///hero 动画演示
class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        child: Hero(
            tag: "hero",
            child: ClipOval(
              child: Image.asset(
                "images/img_head.png",
                width: 50.0,
                height: 50.0,
              ),
            )),
        onTap: () {
          Navigator.pushNamed(context, "/hero/detail");
        },
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Hero(
        tag: "hero",
        child: Image.asset(
          "images/img_head.png",
          height: 50,
          width: 50,
        ),
      )),
    );
  }
}
