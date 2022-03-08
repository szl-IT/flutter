import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:convert/convert.dart';
import 'package:flutter_study/remote/dio_manager/dio_manager.dart';
import 'package:flutter_study/remote/network/api_end_points.dart';
import 'package:flutter_study/ui/wan_android/bean/user_bean.dart';
import 'package:flutter_study/widget/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  var userNameEditController = TextEditingController();
  var passwordEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameEditController.dispose();
    passwordEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Text(""),
          centerTitle: true,
          title: const Text("玩安卓登录"),
          systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("用户名"),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Expanded(
                      child: TextField(
                        controller: userNameEditController,
                        style: const TextStyle(color: Colors.blueAccent),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "用户名"),
                      ))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  const Text("密   码"),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Expanded(
                      child: TextField(
                        controller: passwordEditController,
                        style: const TextStyle(color: Colors.blueAccent),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "密码"),
                      ))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                  onPressed: () => {
                    DioManager.post<UserData>(ApiEndPoints.login,
                        data: FormData.fromMap({
                          "username": userNameEditController.text,
                          "password": passwordEditController.text
                        }))
                        .then((value) =>
                    {
                      LogUtil.e(
                          "base reponse1111111111========${json.encode(
                              value.toJson())}",
                          tag: "szl")
                    })
                  },
                  child: const Text("登录")),
            ],
          ),
        ));
  }
}

// Container(
// margin: const EdgeInsets.only(top: 20, bottom: 20),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// color: Colors.deepOrangeAccent,
// height: 300,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text("用户名："),
// TextField(
// style: const TextStyle(color: Colors.black,fontSize: 30),
// controller: userNameEditController,
// ),
// ],
// ),
// ),
// Container(
// height: 300,
// color: Colors.orange,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// const Padding(
// padding: EdgeInsets.only(left: 20),
// child: Text("密码："),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10),
// child: TextField(
// controller: userNameEditController,
// ),
// )
// ],
// ),
// ),
// ElevatedButton(
// onPressed: () => {
// DioManager.instance
//     .request(
// ApiEndPoints.login,
// method: DioMethod.post,
// data: {
// "username": userNameEditController.text,
// "password": passwordEditController.text
// },
// )
//     .then((value) => {LogUtil.e(value, tag: "szl")})
//     .whenComplete(
// () => {LogUtil.e("complete", tag: "szl")})
//     .onError((error, stackTrace) => {
// LogUtil.e("error" + error.toString(),
// tag: "szl")
// })
// },
// child: const Text("登录")),
// ],
// ),
// ));
