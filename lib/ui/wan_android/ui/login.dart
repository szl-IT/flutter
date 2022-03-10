import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_study/ui/wan_android/view_model/base_vm.dart';
import 'package:flutter_study/ui/wan_android/view_model/login_vm.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginViewModel(), child: const LoginView());
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginView> {
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
            Consumer<LoginViewModel>(builder: (context, viewModel, child) {
              switch (viewModel.state) {
                case LoadState.loading:
                  {
                    EasyLoading.show(status: "Loading....");
                  }
                  break;
                case LoadState.success:
                  {
                    EasyLoading.dismiss().whenComplete(
                        () => Navigator.pushNamed(context, "/home"));
                  }
                  break;
                case LoadState.failed:
                  {
                    EasyLoading.showToast("失败");
                  }
                  break;
                case LoadState.init:
                  break;
              }
              return ElevatedButton(
                  onPressed: () => {
                        viewModel.login(userNameEditController.text,
                            passwordEditController.text)
                      },
                  child: const Text("登录"));
            })
          ],
        ),
      ),
    );
  }
}
