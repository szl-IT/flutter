import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///项目
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProjectState();
  }
}

class ProjectState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("项目"),
        actions: const [Icon(Icons.search)],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
