import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///公众号
class OfficialAccountsPage extends StatefulWidget {
  const OfficialAccountsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OfficialAccountsState();
  }
}

class OfficialAccountsState extends State<OfficialAccountsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("公众号"),
        actions: const [Icon(Icons.search)],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
