import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/remote/dio_manager/dio_manager.dart';
import 'package:flutter_study/remote/network/api_end_points.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<RegisterPage> {
  var userNameEditController = TextEditingController();
  var passwordEditController = TextEditingController();
  var confirmPasswordEditController = TextEditingController();

  @override
  void dispose() {
    userNameEditController.dispose();
    passwordEditController.dispose();
    confirmPasswordEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("注册"),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("用户名"),
                  Expanded(
                      child: TextField(
                    controller: userNameEditController,
                    style: const TextStyle(color: Colors.blueAccent),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "用户名"),
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("密码"),
                  Expanded(
                      child: TextField(
                    controller: passwordEditController,
                    style: const TextStyle(color: Colors.blueAccent),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "密码"),
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("密码"),
                  Expanded(
                      child: TextField(
                    controller: confirmPasswordEditController,
                    style: const TextStyle(color: Colors.blueAccent),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "再次输入密码"),
                  ))
                ],
              ),
              ElevatedButton(
                  onPressed: () => {
                        DioManager.instance
                            .request(
                              ApiEndPoints.register,
                              method: DioMethod.post,
                              data: FormData.fromMap({
                                "username":
                                    userNameEditController.text.toString(),
                                "password":
                                    passwordEditController.text.toString(),
                                "repassword": confirmPasswordEditController.text
                                    .toString()
                              }),
                            )
                            .then((value) => {LogUtil.e(value, tag: "szl")})
                            .whenComplete(
                                () => {LogUtil.e("complete", tag: "szl")})
                            .onError((error, stackTrace) => {
                                  LogUtil.e("error" + error.toString(),
                                      tag: "szl")
                                })
                      },
                  child: const Text("登录"))
            ],
          ),
        ));
  }
}
