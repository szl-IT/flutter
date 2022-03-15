
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SquareState();
  }
}

class SquareState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("广场"),
        actions: const [Icon(Icons.search)],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
