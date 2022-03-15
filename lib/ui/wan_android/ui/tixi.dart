import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///体系
class TixiPage extends StatefulWidget {
  const TixiPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TixiState();
  }
}

class TixiState extends State<TixiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("体系"),
        actions: const [Icon(Icons.search)],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
