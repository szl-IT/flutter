import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleChildScrollDemo extends StatefulWidget {
  const SingleChildScrollDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SingleChildScrollState();
  }
}

class SingleChildScrollState extends State<SingleChildScrollDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          leadingWidth: 100,
          actions: const [Icon(Icons.add)],
          iconTheme: const IconThemeData.fallback(),
          leading: TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.add_call),
              label: const Text(
                "上海",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "首页",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const SingleChildPages());
  }
}

class SingleChildPages extends StatelessWidget {
  const SingleChildPages({Key? key}) : super(key: key);
  final showValue =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        children: showValue
            .split('')
            .map((e) => Text(e, textScaleFactor: 3))
            .toList(),
      )),
    );
  }
}
